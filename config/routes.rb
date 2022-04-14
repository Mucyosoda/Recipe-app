Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
  resources :foods
  resources :recipes, only: [:index, :show]
  resources :public_recipes, only: [:index, :show]
end
