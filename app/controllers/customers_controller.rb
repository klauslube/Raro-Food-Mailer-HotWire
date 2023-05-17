class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_customer_or_payment, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    render json: @customer
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    return render json: @customer if @customer.save
    
    render json: @customer.errors
  end

  def edit; end

  def update
    return render json: @customer if @customer.update(customer_params)

    render json: @customer.errors
  end

  def destroy
    render json: {message: "Deleted successfully"} if @customer.destroy
  end

  private
  
  def customer_params
    params.require(:customer).permit(:user_id, :birthday)
  end

  def fetch_customer_or_payment
    @customer = Customer.find(params[:customer_id]) if params.fetch(:customer_id, nil)
    @payment = Payment.find(params[:payment_id]) if params.fetch(:payment_id, nil)
    @customer ||= @payment.customer
  end
end 