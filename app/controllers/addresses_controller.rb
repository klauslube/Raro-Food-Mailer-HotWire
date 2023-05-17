# frozen_string_literal: true

class AddressesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_chef_or_customer, only: %i[show]

  def show
    render json: @address
  end

  private

  def fetch_chef_or_customer
    @chef = Chef.find(params[:chef_id]) if params.fetch(:chef_id, nil)
    @customer = Customer.find(params[:customer_id]) if params.fetch(:customer_id, nil)

    @address = if @chef
                 @chef.address
               elsif @customer
                 @customer.addresses.find(params[:id])
               end
  end
end
