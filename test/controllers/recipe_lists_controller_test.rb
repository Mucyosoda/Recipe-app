require 'test_helper'

class RecipeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_list = recipe_lists(:one)
  end

  test 'should get index' do
    get recipe_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_recipe_list_url
    assert_response :success
  end

  test 'should create recipe_list' do
    assert_difference('RecipeList.count') do
      post recipe_lists_url, params: { recipe_list: { description: @recipe_list.description, name: @recipe_list.name } }
    end

    assert_redirected_to recipe_list_url(RecipeList.last)
  end

  test 'should show recipe_list' do
    get recipe_list_url(@recipe_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_recipe_list_url(@recipe_list)
    assert_response :success
  end

  test 'should update recipe_list' do
    patch recipe_list_url(@recipe_list),
          params: { recipe_list: { description: @recipe_list.description, name: @recipe_list.name } }
    assert_redirected_to recipe_list_url(@recipe_list)
  end

  test 'should destroy recipe_list' do
    assert_difference('RecipeList.count', -1) do
      delete recipe_list_url(@recipe_list)
    end

    assert_redirected_to recipe_lists_url
  end
end
