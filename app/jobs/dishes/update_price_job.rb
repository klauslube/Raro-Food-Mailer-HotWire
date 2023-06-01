module Dishes
  class UpdatePriceJob < ApplicationJob
    queue_as :dishes
    sidekiq_options retry: 3

    rescue_from(ActiveRecord::RecordNotFound) do
      # Aqui podemos:
      # Logar o erro
      logger.error "Erro ao encontrar o registro do prato: #{exception.message}"
      # Enviar email explicitando o motivo do erro
      # Salvar em uma tabela de log
      # etc ...
    end

    def perform(dish_id)
      dish = Dish.find(dish_id)
      updated_unit_price = dish.unit_price

      update_price_service = UpdatePriceService.new(dish_id, updated_unit_price)
      update_price_service.update_dish_price
    end
  end
end
