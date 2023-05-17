# frozen_string_literal: true

class ChefsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_chef, only: %i[show edit update destroy]

  def index
    @chefs = Chef.all
    render json: @chefs
  end

  def show
    render json: @chef
  end

  def new
    @chef = Chef.new 
  end

  def create
    @chef = Chef.new(chef_params)
    return render json: @chef if @chef.save
    
    render json: @chef.errors
  end

  def edit; end

  def update
    return render json: @chef if @chef.update(chef_params)

    render json: @chef.errors
  end

  def destroy
    render json: {message: "Deleted successfully"} if @chef.destroy
  end

  private

  def chef_params
    params.require(:chef).permit(:user_id, :address_id, :approver_id)
  end

  def fetch_chef
    @chef = Chef.find(params[:id])
  end
  
end
