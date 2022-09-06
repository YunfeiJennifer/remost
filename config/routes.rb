Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cities, only: [:index, :show] do
    resources :tips, only: [:index, :new, :create, :destroy] do
      resources :bookmarked_places, only: [:create]
    end
  end
  resources :companies, only: [:new, :create]
  resources :trips
  resources :bookmarked_places, only: [:index, :destroy]
end
