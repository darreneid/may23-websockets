Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount ActionCable.server => '/cable'

  namespace :api, defaults: { format: :json } do
    resources :messages, only: [:index, :create]
  end
end
