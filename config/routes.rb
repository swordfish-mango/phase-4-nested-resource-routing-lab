Rails.application.routes.draw do
  resources :items, only: [:index] do
    resources :users, only: [:index,:show]
  end
  resources :users, only: [:show] do
    resources :items, only: [:index,:show,:create]
  end
end
