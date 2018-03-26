Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post '/new-response-webhook', to: 'webhooks#receive', as: :receive_webhooks
  patch '/validate-batch', to: 'surgeries#validate_batch', as: :validate_batch

  resources :forms, only: [ :index, :new, :create, :update]


  resources :surgeries, only: [ :show, :update, :index ]

end
