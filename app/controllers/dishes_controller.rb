# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :fetch_dish, only: %i[show edit update destroy]

  def index
    @dishes = Dish.all
  end

  def show; end

  def new
    @dish = Dish.new
  end

  def edit; end

  def create
    @dish = Dish.new(dish_params)

    return redirect_to dish_path(@dish), notice: 'Prato foi criado com sucesso.' if @dish.save

    render :new, status: :unprocessable_entity
  end

  def update
    return render @dish, notice: 'Prato alterado com sucesso' if @dish.update(dish_params)
  end

  def destroy
    return redirect_to dishes_path, notice: 'Prato deletado com sucesso' if @dish.destroy
  end

  private

  def dish_params
    params.require(:dish).permit(:chef_id, :name, :description, :available, :active, :unit_price, category_ids: [])
  end

  def fetch_dish
    @dish = Dish.find(params[:id])
  end
end
