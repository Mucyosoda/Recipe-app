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
end
