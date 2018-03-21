Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :forms, only: [ :index, :new, :create]
  resources :surgeries, only: [ :show, :update ]
end
