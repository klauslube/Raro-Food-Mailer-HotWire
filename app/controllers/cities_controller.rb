class CitiesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_chef, only: %i[show]
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

  def fetch_chef
    @chef = Chef.find(params[:chef_id])
    @city = @chef.city
  end

  def city_params
    params.require(:city).permit(:name, :state_id)
  end
end
