# frozen_string_literal: true

class DishesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :fetch_dish_or_chef, only: %i[index edit update destroy]
  # before_action :fetch_dishes_with_order, only: %i[show, create]

  # def index
  #   # @dishes = @chef.dishes unless @chef.nil?
  #   @dishes = Dish.all
  # end

  def show
  end

  def new
    @dish = Dish.new
  end

  # def edit; end

  def create
    @dish = Dish.new(dish_params)
  
    if @dish.save
      return redirect_to dish_path(@dish), notice: "Prato foi criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:chef_id, :name, :description, :available, :active, :unit_price, category_ids: [])
  end

  def fetch_dish_or_chef
    @chef = Chef.find(params[:chef_id])
    # @order = Order.find(params[:order_id]) if params.fetch(:order_id, nil)
  end

  def fetch_dishes_with_order
    @dish = Dish.find(params[:dish_id]) 
    @chef = Chef.find(params[:chef_id]) 
  #   @order = Order.find(params[:order_id]) if params.fetch(:order_id, nil)
  #   @dish = @order.dishes.find(params[:id]) if params.fetch(:id, nil)
  end
end
