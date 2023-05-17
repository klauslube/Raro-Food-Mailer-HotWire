class AddressesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_chef, only: %i[show]

  def show
    @address = @chef.address
    render json: @address
  end

  private

  def fetch_chef
    @chef = Chef.find(params[:chef_id])
  end
end