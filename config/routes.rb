Rails.application.routes.draw do
  devise_for :users
  get 'recipe_foods/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    authenticated :user do
      root :to => 'foods#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
    resources :foods
  resources :recipes do
    resources :recipe_foods, only: %i[create destroy new]
  end
  resources :public_recipes, only: [:index]
end
