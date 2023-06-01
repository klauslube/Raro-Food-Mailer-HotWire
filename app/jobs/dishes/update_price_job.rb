module Dishes
  class UpdatePriceJob < ApplicationJob
    queue_as :dishes
    sidekiq_options retry: 3

    def perform(dish_id)
      Dishes::UpdatePriceService.new(dish_id).call
    end
  end
end
