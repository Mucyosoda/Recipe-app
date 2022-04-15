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

  def create
    @recipe= current_user.recipes.new(recipe_params)
    if @recipe.save
    format.html { redirect_to recipes_path, notice: 'Recipe created successfully' }
    else
      format.html { redirect_to new_recipe_path, notice: 'something went wrong, Please try again' }
    end
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe removed successfully'
    redirect_to recipes_path
  end
end
