module Dishes
  class UpdatePriceService
    
    def initialize(dish_id)
      @dish_id = dish_id
    end

    def call
      update_order_price
    end

    private

    def update_order_price
      dish = Dish.find(@dish_id)
      order_items = dish.items.joins(:order).where(orders: { status: :started }) 

      order_items.each do |item|
        item.update(unit_price: dish.unit_price)
      end 
    end

  end
end