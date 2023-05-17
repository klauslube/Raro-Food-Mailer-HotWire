# frozen_string_literal: true

class DishesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_dish_or_chef, only: %i[index edit update destroy]
  before_action :fetch_dishes_with_order, only: %i[show]

  def index
    @dishes = @chef.dishes unless @chef.nil?
    @dishes ||= Dish.all
    render json: @dishes
  end

  def show
    render json: @dish
  end

  def new
    @dish = Dish.new
  end

  def edit; end

  def create
    @dish = Dish.new(state_params)
    return render json: @dish if @dish.save

    render json: @dish.errors
  end

  def update
    return render json: @dish if @dish.update(dish_params)

    render json: @dish.errors
  end

  def destroy
    render json: { message: 'Deleted successfully' } if @dish.destroy
  end

  private

  def dish_params
    params.require(:dish).permit(:chef_id, :name, :description, :available, :active, :unit_price)
  end

  def fetch_dish_or_chef
    @chef = Chef.find(params[:chef_id]) if params.fetch(:chef_id, nil)
    @order = Order.find(params[:order_id]) if params.fetch(:order_id, nil)
  end

  def fetch_dishes_with_order
    @dish = Dish.find(params[:dish_id]) if params.fetch(:dish_id, nil)
    @order = Order.find(params[:order_id]) if params.fetch(:order_id, nil)
    @dish = @order.dishes.find(params[:id]) if params.fetch(:id, nil)
  end
end
