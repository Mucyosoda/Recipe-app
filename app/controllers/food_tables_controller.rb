class FoodTablesController < ApplicationController
  before_action :set_food_table, only: %i[ show edit update destroy ]

  # GET /food_tables or /food_tables.json
  def index
    @food_tables = FoodTable.all
  end

  # GET /food_tables/1 or /food_tables/1.json
  def show
  end

  # GET /food_tables/new
  def new
    @food_table = FoodTable.new
  end

  # GET /food_tables/1/edit
  def edit
  end

  # POST /food_tables or /food_tables.json
  def create
    @food_table = FoodTable.new(food_table_params)

    respond_to do |format|
      if @food_table.save
        format.html { redirect_to food_table_url(@food_table), notice: "Food table was successfully created." }
        format.json { render :show, status: :created, location: @food_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_tables/1 or /food_tables/1.json
  def update
    respond_to do |format|
      if @food_table.update(food_table_params)
        format.html { redirect_to food_table_url(@food_table), notice: "Food table was successfully updated." }
        format.json { render :show, status: :ok, location: @food_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_tables/1 or /food_tables/1.json
  def destroy
    @food_table.destroy

    respond_to do |format|
      format.html { redirect_to food_tables_url, notice: "Food table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_table
      @food_table = FoodTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_table_params
      params.require(:food_table).permit(:Food_name, :Unit, :Price)
    end
end
