class ShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.all
    @foods = ShoppingList.missing_food_id(@recipes)
    @list = []
    @foods.each do |food_id|
      @list << Food.find(food_id)
    end
    @list
  end
end
