Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post '/new-response-webhook', to: 'webhooks#receive', as: :receive_webhooks
  patch '/update-batch', to: 'surgeries#update_batch', as: :update_batch
  post '/surgeries/notice', to: 'surgeons#notice', as: :notice
  post '/surgeries/relanceSMS', to: 'patients#relance_sms', as: :relanceSMS
  post '/sms-batch', to: 'patients#sms_batch', as: :sms_batch

  get '/statistiques', to: 'pages#dashboard', as: :dashboard

  resources :forms, only: [ :index, :new, :create, :update]

  resources :surgeries, only: [ :show, :update, :index ]

end
