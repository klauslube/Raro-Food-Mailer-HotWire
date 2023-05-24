# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :fetch_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_url(@category), notice: 'Categoria foi criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    redirect_to @category, notice: 'Categoria alterada com sucesso' if @category.update(category_params)
  end

  def destroy
    redirect_to categories_path, notice: 'Categoria deletada com sucesso' if @category.destroy
  end

  private

  def fetch_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
