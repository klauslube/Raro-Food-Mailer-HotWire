class CitiesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_state, only: [:index]

  def index
    @cities = @state.cities
    render json: @cities
  end

  def show_chef_city
    @chef = Chef.find(params[:id])
    @city = @chef.city
    render json: @city
  end

  private

  def fetch_state
    @state = State.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :state_id)
  end
end
