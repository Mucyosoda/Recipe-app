class FoodsController < ApplicationController
  def index
  @food = Food.all
  end

  def new
    @food =Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    respond_to do |format| 
    if @food.save 
      flash[:notice] = 'Food created successfully'
      format.html { redirect_to foods_path(foods_path)}
    else
      flash[:notice] = 'something went wrong, Try Again '
      format.html {render :new}
    end 
    end
  end

  def destroy
    @food = Food.find(params[:id]) 
    @food.destroy 
    flash[:notice] = 'Food deleted successfully'
    redirect_to foods_path(foods_path)
  end

  private 
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
