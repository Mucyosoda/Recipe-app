class RecipesController < ApplicationController
  def index
    @recipes = if current_user.nil?
                 []
               else
                 current_user.recipes
               end
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
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe removed successfully'
    redirect_to recipes_path
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    public = params[:public] == '1'
    @recipe.update_attribute(:public, public)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
