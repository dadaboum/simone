Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :forms, only: [ :index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surgeries, only: [ :index, :show ]





  # WEBHOOKS - Retrieve responses
  post '/new-response-webhook', to: 'webhooks#receive', as: :receive_webhooks
end
