require 'application_system_test_case'

class FoodTablesTest < ApplicationSystemTestCase
  setup do
    @food_table = food_tables(:one)
  end

  test 'visiting the index' do
    visit food_tables_url
    assert_selector 'h1', text: 'Food tables'
  end

  test 'should create food table' do
    visit food_tables_url
    click_on 'New food table'

    fill_in 'Food name', with: @food_table.Food_name
    fill_in 'Price', with: @food_table.Price
    fill_in 'Unit', with: @food_table.Unit
    click_on 'Create Food table'

    assert_text 'Food table was successfully created'
    click_on 'Back'
  end

  test 'should update Food table' do
    visit food_table_url(@food_table)
    click_on 'Edit this food table', match: :first

    fill_in 'Food name', with: @food_table.Food_name
    fill_in 'Price', with: @food_table.Price
    fill_in 'Unit', with: @food_table.Unit
    click_on 'Update Food table'

    assert_text 'Food table was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Food table' do
    visit food_table_url(@food_table)
    click_on 'Destroy this food table', match: :first

    assert_text 'Food table was successfully destroyed'
  end
end
