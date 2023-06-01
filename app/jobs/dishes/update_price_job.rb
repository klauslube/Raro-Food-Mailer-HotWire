module Dishes
  class UpdatePriceJob < ApplicationJob
    queue_as :dishes
    sidekiq_options retry: 3

    def perform(dish_id)
      dish = Dish.find(dish_id)
      updated_unit_price = dish.unit_price

      update_price_service = UpdatePriceService.new(dish_id, updated_unit_price)
      update_price_service.update_dish_price
    end
  end
end
