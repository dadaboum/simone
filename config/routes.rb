Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post '/new-response-webhook', to: 'webhooks#receive', as: :receive_webhooks
  patch '/validate-batch', to: 'surgeries#validate_batch', as: :validate_batch
  post '/surgeries/notice', to: 'surgeons#notice', as: :notice
  post '/surgeries/relanceSMS', to: 'patients#relance_sms', as: :relanceSMS

  resources :forms, only: [ :index, :new, :create, :update]


  resources :surgeries, only: [ :show, :update, :index ]

end
