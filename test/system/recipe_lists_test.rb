require "application_system_test_case"

class RecipeListsTest < ApplicationSystemTestCase
  setup do
    @recipe_list = recipe_lists(:one)
  end

  test "visiting the index" do
    visit recipe_lists_url
    assert_selector "h1", text: "Recipe lists"
  end

  test "should create recipe list" do
    visit recipe_lists_url
    click_on "New recipe list"

    fill_in "Description", with: @recipe_list.description
    fill_in "Name", with: @recipe_list.name
    click_on "Create Recipe list"

    assert_text "Recipe list was successfully created"
    click_on "Back"
  end

  test "should update Recipe list" do
    visit recipe_list_url(@recipe_list)
    click_on "Edit this recipe list", match: :first

    fill_in "Description", with: @recipe_list.description
    fill_in "Name", with: @recipe_list.name
    click_on "Update Recipe list"

    assert_text "Recipe list was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe list" do
    visit recipe_list_url(@recipe_list)
    click_on "Destroy this recipe list", match: :first

    assert_text "Recipe list was successfully destroyed"
  end
end
