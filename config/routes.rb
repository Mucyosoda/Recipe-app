Rails.application.routes.draw do
  resources :recipe_lists
  resources :recipes
  resources :food_tables
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "recipe-lists/index"
  get "foods/new_food"
  root "food_tables#index"
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show]
  resources :public_recipes, only: [:index, :show]
end
