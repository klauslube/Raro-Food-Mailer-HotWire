# frozen_string_literal: true

class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_customer_or_payment, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  # def edit; end

  def create
    @customer = Customer.new(customer_params)
  
    if @customer.save
      redirect_to customer_url(@customer), notice: "Customer foi criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   return render json: @customer if @customer.update(customer_params)

  #   render json: @customer.errors
  # end

  # def destroy
  #   render json: { message: 'Deleted successfully' } if @customer.destroy
  # end

  private

  def customer_params
    params.require(:customer).permit(:birthday, user_attributes: %i[name cpf email password], addresses_attributes: %i[name public_place zip_code number neighborhood city_id addressable_type addressable_id])
  end

  def fetch_customer_or_payment
    @customer = Customer.find(params[:customer_id]) if params.fetch(:customer_id, nil)
    @payment = Payment.find(params[:payment_id]) if params.fetch(:payment_id, nil)
    @customer ||= @payment.customer
  end
end
