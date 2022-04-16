class ShoppingListController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @ingredients = RecipeFood.where(recipe_id: @recipes.map(&:id))
    @foods = Food.where(id: @ingredients.map(&:food_id))

    @total_price = ShoppingList.new.total_price(@ingredients)
    current_user.recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        @total_price += recipe_food.food.price * recipe_food.quantity
      end
    end

    @recipe_foods = []
    current_user.recipes.each do |recipe|
      @recipe_foods.push(recipe.recipe_foods)
    end
    puts @recipe_foods
    redirect_to shopping_list_index_path if @recipe_foods.length.positive?
  end
end
