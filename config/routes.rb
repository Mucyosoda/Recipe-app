Rails.application.routes.draw do
  get 'recipe_foods/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
  resources :foods
  resources :recipes do
    resources :recipe_foods, only: %i[create destroy new]
  end
  resources :public_recipes, only: [:index]
end
