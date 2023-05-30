module Dishes
  class UpdatePriceService
    
    def initialize(dish_id, updated_unit_price)
      @dish_id = dish_id
      @updated_unit_price = updated_unit_price
    end

    def update_dish_price
      dish = Dish.find(@dish_id)
      old_unit_price = dish.unit_price
      dish.update(unit_price: @updated_unit_price)
      
      update_order_price(dish)
    end

    def update_order_price(dish)
      order_items = dish.items.joins(:order).where(orders: { status: :started }) 

      order_items.each do |item|
        item.update(unit_price: @updated_unit_price)
        order = Order.find(item.order_id)
        order.update_total_price
      end 
    end

  end
end