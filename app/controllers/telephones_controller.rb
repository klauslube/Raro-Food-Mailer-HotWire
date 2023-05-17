# frozen_string_literal: true

class TelephonesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_chef_or_customer, only: %i[index]

  def index
    render json: @telephones
  end

  private

  def fetch_chef_or_customer
    @chef = Chef.find(params[:chef_id]) if params.fetch(:chef_id, nil)
    @customer = Customer.find(params[:customer_id]) if params.fetch(:customer_id, nil)

    @telephones = if @chef
                    @chef.telephones
                  elsif @customer
                    @customer.telephones
                  end
  end
end
