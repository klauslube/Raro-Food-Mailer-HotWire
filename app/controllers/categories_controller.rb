# frozen_string_literal: true

class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_category, only: %i[show]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(chef_params)
  
    if @category.save
      redirect_to category_url(@category), notice: "Categoria foi criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def fetch_category
    @category = Category.find(params[:id])
  end

  def chef_params
    params.require(:category).permit(:name)
  end

end
