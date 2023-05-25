# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :fetch_chef, only: %i[show edit update destroy]

  def index
    @chefs = Chef.all
    render :index
  end

  def show; end

  def new
    @chef = Chef.new
    @chef.build_address
    @chef.build_user
  end

  def edit; end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      redirect_to chef_url(@chef), notice: 'Chef foi criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @chef.update(chef_params)
      redirect_to @chef, notice: 'Chef foi alterado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chef.destroy
    redirect_to chefs_path, notice: 'Chef foi apagado com sucesso'
  end

  private

  def chef_params
    params.require(:chef).permit(
      :approver_id,
      user_attributes: %i[id name cpf email password],
      address_attributes: %i[id name public_place zip_code number neighborhood city_id addressable_type addressable_id]
    )
  end

  def fetch_chef
    @chef = Chef.find(params[:chef_id])
  end
end
