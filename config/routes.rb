Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show] do
    resources :recipe_foods, only: %i[create destroy new]
  end
  resources :public_recipes, only: [:index, :show]
end
