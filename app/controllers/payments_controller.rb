class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_payment_or_order, only: %i[show edit update destroy]

  def index
    @payments = Payment.all
    render json: @payments
  end

  def show
    render json: @payment
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    return render json: @payment if @payment.save
    
    render json: @payment.errors
  end

  def edit; end

  def update
    return render json: @payment if @payment.update(payment_params)

    render json: @payment.errors
  end

  def destroy
    render json: {message: "Deleted successfully"} if @payment.destroy
  end

  private
  
  def payment_params
    params.require(:payment).permit(:payment_type, :state, :order_id, :card_id)
  end

  def fetch_payment_or_order
    @payment = Payment.find(params[:payment_id]) if params.fetch(:payment_id, nil)
    @order = Order.find(params[:order_id]) if params.fetch(:order_id, nil)
    
    @payment ||= @order.payment
  end
end