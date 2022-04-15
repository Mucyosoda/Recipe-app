class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes 
  end

  def new
    @recipe = Recipe.new
  end

  def show
   @recipe = Recipe.find(params[:id])
   @user = @recipe.user
   @recipe_foods = @recipe.recipe_foods
  end


end
