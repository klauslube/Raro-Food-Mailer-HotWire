class TelephonesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_chef, only: %i[index]
   
  def index
    @address = @chef.telephones
    render json: @address
  end

  private

  def fetch_chef
    @chef = Chef.find(params[:chef_id])
  end
end