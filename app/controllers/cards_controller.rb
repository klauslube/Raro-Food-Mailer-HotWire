# frozen_string_literal: true

class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :fetch_card, only: %i[show]

  def show
    render json: @card
  end

  private

  def fetch_card
    @customer = Customer.find(params[:customer_id])
    @card = @customer.cards.find(params[:id])
  end
end
