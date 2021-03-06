require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  it 'goes to recipes page' do
    visit '/users/sign_in'
    User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    click_link 'Recipes'

    expect(page).to have_content('List of Recipes')
  end

  it 'creates a recipe' do
    visit '/users/sign_in'
    User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    click_link 'Recipes'

    click_link 'Add Recipe'

    fill_in 'recipe_name', with: 'Flafel'
    fill_in 'recipe_description', with: 'Egyptian'
    fill_in 'recipe_preparation_time', with: '2'
    fill_in 'recipe_cooking_time', with: '3'

    click_button 'Create Recipe'

    expect(page).to have_content('Flafel')
    expect(page).to have_content('Egyptian')
  end

  it 'goes to recipes details and adds ingredients' do
    visit '/users/sign_in'
    user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    recipe = user.recipes.create!(name: 'Flafel', description: 'Egyptian', preparation_time: 2, cooking_time: 3)
    food1 = user.foods.create!(name: 'pineapple', measurement_unit: 'grams', price: 3)
    user.foods.create!(name: 'chicken', measurement_unit: 'units', price: 12)

    click_link 'Recipes'

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.description)

    click_link 'Show'

    expect(page).to have_content('Preparation time:')
    expect(page).to have_content('Cooking time:')
    expect(page).to have_content('Cooking steps:')
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.description)

    click_link 'Add ingredient'

    find(:css, '#recipe_food_food_id').find(:option, 'pineapple').select_option
    fill_in 'recipe_food_quantity', with: 50

    click_button 'Add Ingredient'

    expect(page).to have_content(food1.name)
    expect(page).to have_content(food1.measurement_unit)
    expect(page).to have_content("$#{50 * food1.price}")
  end

  it 'goes to recipe details and removes ingredient' do
    visit '/users/sign_in'
    user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    recipe = user.recipes.create!(name: 'Flafel', description: 'Egyptian', preparation_time: 2, cooking_time: 3)
    food = user.foods.create!(name: 'pineapple', measurement_unit: 'grams', price: 3)
    RecipeFood.create!(quantity: 50, recipe: recipe, food: food)

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content(food.name)
    expect(page).to have_content(food.measurement_unit)
    expect(page).to have_content("$#{50 * food.price}")

    click_button 'Delete'

    expect(page).to_not have_content(food.name)
    expect(page).to_not have_content(food.measurement_unit)
    expect(page).to_not have_content("$#{50 * food.price}")
  end

  it 'goes to recipes page and removes the recipe' do
    visit '/users/sign_in'
    user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    recipe = user.recipes.create!(name: 'Flafel', description: 'Egyptian', preparation_time: 2, cooking_time: 3)

    click_link 'Recipes'

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.description)

    click_button 'Delete'

    expect(page).to_not have_content(recipe.name)
    expect(page).to_not have_content(recipe.description)
  end

  it 'goes to recipe detail page toggles public checkbox and checks it is not public anymore' do
    visit '/users/sign_in'
    user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    recipe = user.recipes.create!(name: 'Flafel', description: 'Egyptian', preparation_time: 2, cooking_time: 3)

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content('Public')

    find(:css, '#flexSwitchCheckChecked').set(false)

    visit '/public_recipes'

    expect(page).to_not have_content(recipe.name)
    expect(page).to_not have_content(recipe.description)
  end
end
