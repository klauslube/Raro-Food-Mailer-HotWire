class MoveDescriptionToActionText < ActiveRecord::Migration[7.0]
  def change
    Dish.all.find_each do |desc|
      desc.update(content: desc.description)
    end

    remove_column :dishes, :description
  end
end
