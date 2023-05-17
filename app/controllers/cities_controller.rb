# frozen_string_literal: true

class CitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_chef_or_order, only: %i[show]
  before_action :fetch_state, only: %i[index]

  def index
    @cities = @state.cities
    render json: @cities
  end

  def show
    render json: @city
  end

  private

  def fetch_state
    @state = State.find(params[:id])
  end

  def fetch_chef_or_order
    @chef = Chef.find(params[:chef_id]) if params.fetch(:chef_id, nil)
    @order = Order.find(params[:order_id]) if params.fetch(:order_id, nil)

    @city = if @chef
              @chef.city
            elsif @order
              @order.city
            end
  end

  def city_params
    params.require(:city).permit(:name, :state_id)
  end
end
