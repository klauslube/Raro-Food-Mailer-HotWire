# frozen_string_literal: true

class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_order_item, only: %i[show]

  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
    # @order.build
  end

  # def edit; end

  def create
    @order_item = OrderItem.new(order_item_params)

    if @order_item.save
      redirect_to @order_item, notice: "Item foi criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :dish_id, :amount, :unit_price)
  end

  def fetch_order_item
    @order = OrderItem.find(params[:id])
  end
end
