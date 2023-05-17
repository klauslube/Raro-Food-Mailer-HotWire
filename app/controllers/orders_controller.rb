class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_order_coupon_customer, only: %i[index show edit update destroy]

  def index
    @orders = @coupon.orders unless @coupon.nil?
    @orders = @customer.orders unless @customer.nil?
    @orders ||= Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    return render json: @order if @order.save
    
    render json: @order.errors
  end

  def edit; end

  def update
    return render json: @order if @order.update(order_params)

    render json: @order.errors
  end

  def destroy
    render json: {message: "Deleted successfully"} if @order.destroy
  end

  private
  
  def order_params
    params.require(:order).permit(:customer_id, :delivery_address_id, :total_price, :freight_price, :status, :coupon_id)
  end

  def fetch_order_coupon_customer
    @order = Order.find(params[:order_id]) if params.fetch(:order_id, nil)
    @coupon = Coupon.find(params[:id]) if params.fetch(:id, nil)
    @customer = Customer.find(params[:customer_id]) if params.fetch(:customer_id, nil)
  end
end