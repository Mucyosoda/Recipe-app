class ShoppingList < ApplicationRecord
  def self.missing_food_id(recipes)
    selected_food = []
    recipes.each do |recipe|
      recipe.recipe_foods.each do |food|
        selected_food << food.food_id
      end
    end
    available_food = []
    Food.all.each do |food|
      available_food << food.id
    end
   available_food - selected_food
  end
end
