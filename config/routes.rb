Rails.application.routes.draw do
  get "welcome/index"

  get "welcome/about"

  root 'welcome#index'

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create]
    end

    resources :items, only: [:destroy]
    end
end
