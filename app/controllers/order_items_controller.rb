# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :fetch_order_item, only: %i[show]

  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
    @order_item.order_id = params[:order_id]
    @order_item.unit_price = @order_item.dish&.unit_price
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    @order_item.order = Order.find(params[:order_item][:order_id])
  
    if @order_item.save
      redirect_to edit_order_path(@order_item.order), notice: "Item foi adicionado com sucesso."
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
