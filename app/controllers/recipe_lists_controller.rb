class RecipeListsController < ApplicationController
  before_action :set_recipe_list, only: %i[show edit update destroy]

  # GET /recipe_lists or /recipe_lists.json
  def index
    @recipe_lists = RecipeList.all
  end

  # GET /recipe_lists/1 or /recipe_lists/1.json
  def show; end

  # GET /recipe_lists/new
  def new
    @recipe_list = RecipeList.new
  end

  # GET /recipe_lists/1/edit
  def edit; end

  # POST /recipe_lists or /recipe_lists.json
  def create
    @recipe_list = RecipeList.new(recipe_list_params)

    respond_to do |format|
      if @recipe_list.save
        format.html { redirect_to recipe_list_url(@recipe_list), notice: 'Recipe list was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_lists/1 or /recipe_lists/1.json
  def update
    respond_to do |format|
      if @recipe_list.update(recipe_list_params)
        format.html { redirect_to recipe_list_url(@recipe_list), notice: 'Recipe list was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_lists/1 or /recipe_lists/1.json
  def destroy
    @recipe_list.destroy

    respond_to do |format|
      format.html { redirect_to recipe_lists_url, notice: 'Recipe list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_list
    @recipe_list = RecipeList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_list_params
    params.require(:recipe_list).permit(:name, :description)
  end
end
