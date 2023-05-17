class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @categories = Category.all
    render json: @categories
  end
  # def index
  #   @dish = Dish.find(params[:dish_id])
  #   @categories = @dish.categories
  #   render json: @categories
  # end
  # def category_params
  #   params.require(:category).permit(:name)
  # end
end