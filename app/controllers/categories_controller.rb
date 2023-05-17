# frozen_string_literal: true

class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_dish, only: %i[index]

  def index
    @categories = @dish.categories
    render json: @categories
  end

  private

  def fetch_dish
    @dish = Dish.find(params[:dish_id])
  end
end
