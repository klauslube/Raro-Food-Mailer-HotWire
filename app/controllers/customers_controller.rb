# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def show; end

  def new
    @customer = Customer.new
    @customer.build_user
    @customer.addresses.build
  end

  # def edit; end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customer_url(@customer), notice: 'Cliente foi criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Cliente alterado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to customers_path, notice: 'Cliente deletado com sucesso' if @customer.destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:birthday, user_attributes: %i[id name cpf email password],
                                                addresses_attributes: %i[id name public_place zip_code number neighborhood city_id addressable_type addressable_id])
  end

  def fetch_customer
    @customer = Customer.find(params[:id])
  end
end
