Rails.application.routes.draw do
  get "welcome/index"

  get "welcome/about"

  root 'welcome#index'

  #match '/api/users/:id/list/:id/items' => 'item#completed', as: 'completed_item', via: :put
  #match '/api/users/:id/list/:id/items' => 'item#incomplete', as: 'incomplete_item', via: :delete

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create, :update]
    end

    resources :items, only: [:destroy, :update]
    end
end
