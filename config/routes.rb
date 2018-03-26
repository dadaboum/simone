Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post '/new-response-webhook', to: 'webhooks#receive', as: :receive_webhooks
  post '/surgeries/:surgery_id', to: 'surgeons#notice', as: :notice

  resources :forms, only: [ :index, :new, :create, :update]


  resources :surgeries, only: [ :show, :update, :index ]

end
