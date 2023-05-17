class DishesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_dish, only: %i[index show edit update destroy]

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

  def create
    @dish = Dish.new(state_params)
    return render json: @dish if @dish.save
    
    render json: @dish.errors
  end

  def edit; end

  def update
    return render json: @dish if @dish.update(dish_params)

    render json: @dish.errors
  end

  def destroy
    render json: {message: "Deleted successfully"} if @dish.destroy
  end

  private
  
  def dish_params
    params.require(:dish).permit(:chef_id, :name, :description, :available, :active, :unit_price)
  end

  def fetch_dish
    @dish = Dish.find(params[:dish_id]) if params.fetch(:dish_id, nil)
    @chef = Chef.find(params[:chef_id]) if params.fetch(:chef_id, nil)
  end
end