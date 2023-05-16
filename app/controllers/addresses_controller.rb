class AddressesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  
  def show_chef_address
    @chef = Chef.find(params[:id])
    @address = @chef.address
    render json: @address
  end
end