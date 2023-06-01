# frozen_string_literal: true

class Dish < ApplicationRecord
  # Comentado para evitar default_scope
  has_rich_text :content
  has_one_attached :cover_image
  belongs_to :chef
  has_and_belongs_to_many :categories

  has_many :items, class_name: 'OrderItem', dependent: :destroy
  
  validates :name, :content, :unit_price, presence: true
  validates :available, :active, inclusion: [true, false]
  validates :unit_price, numericality: { greater_than: 0 }
  validate :can_unit_price_be_changed?, on: :update, if: proc { unit_price_changed? }

  scope :costs_more_than, ->(amount) { where('unit_price > ?', amount) }
  scope :active, -> { where(active: true) }
  scope :available, -> { where(available: true) }
  scope :sold, -> { joins(items: :order).where(orders: { status: :finished }) }
  scope :sold_by_dish, ->(dish_id) { where(dishes: { id: dish_id }) }

  accepts_nested_attributes_for :categories

  def can_be_sold?
    active? && available?
  end

  after_update :update_price

  private

  def can_unit_price_be_changed?
    return if OrderItem.order_items_by_dishes_on_finished_orders(id).blank?

    errors.add(:unit_price, 'unit price cannot be changed')
  end

  def update_price
    Dishes::UpdatePriceJob.perform_later(id)
  end
end
