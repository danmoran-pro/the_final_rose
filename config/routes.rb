Rails.application.routes.draw do

  resources :bachelorettes, only: [:show] do
    resources :contestants, only: [:index]
  end

  resources :contestants, only: [:show]
  resources :outings, only: [:show]
end
