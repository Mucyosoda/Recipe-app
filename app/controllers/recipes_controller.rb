class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipes = Recipe.new
  end

  def create
    @recipes = current_user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        flash[:notice] = 'Recipe created successfully'
        format.html { redirect_to recipes_path(recipes_path) }
      else
        flash[:notice] = 'something went wrong, Try Again '
        format.html { render :new }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe deleted successfully'
    redirect_to recipes_path(recipes_path)
  end
end
