class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_order, only: %i[show]

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  def fetch_order
    @order = Order.find(params[:order_id]) if params.fetch(:order_id, nil)
  end
end