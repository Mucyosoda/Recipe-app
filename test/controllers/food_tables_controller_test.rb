require "test_helper"

class FoodTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_table = food_tables(:one)
  end

  test "should get index" do
    get food_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_food_table_url
    assert_response :success
  end

  test "should create food_table" do
    assert_difference("FoodTable.count") do
      post food_tables_url, params: { food_table: { Food_name: @food_table.Food_name, Price: @food_table.Price, Unit: @food_table.Unit } }
    end

    assert_redirected_to food_table_url(FoodTable.last)
  end

  test "should show food_table" do
    get food_table_url(@food_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_table_url(@food_table)
    assert_response :success
  end

  test "should update food_table" do
    patch food_table_url(@food_table), params: { food_table: { Food_name: @food_table.Food_name, Price: @food_table.Price, Unit: @food_table.Unit } }
    assert_redirected_to food_table_url(@food_table)
  end

  test "should destroy food_table" do
    assert_difference("FoodTable.count", -1) do
      delete food_table_url(@food_table)
    end

    assert_redirected_to food_tables_url
  end
end
