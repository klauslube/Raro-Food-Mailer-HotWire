# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Pedido foi criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @order.status = :preparing if @order.order_items.any?

    if @order.update(order_params)
      redirect_to @order, notice: 'Pedido foi alterado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to orders_path, notice: 'Pedido deletado com sucesso' if @order.destroy
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :delivery_address_id, :total_price, :freight_price, :status, :coupon_id)
  end

  def fetch_order
    @order = Order.find(params[:id])
  end
end
