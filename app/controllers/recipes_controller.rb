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
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
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

  def update
    @recipe = Recipe.find(params[:id])
    @recipe_state = params[:public]
    @checked = false
    if @recipe_state == true
      checked = true
    else
      checked
    end
    @recipe.update_attribute(:public, checked)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
