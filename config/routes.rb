Rails.application.routes.draw do

  devise_for :users, :path => 'accounts', :controllers  => {:omniauth_callbacks => "users/omniauth_callbacks"}

  root 'dashboard#index'

  resources :users, only: [] do
    resources :encounters, only: [:new, :create, :edit, :update]
  end

  get '/encounters', to: 'encounters#index', as: 'encounters'
  get '/encounters/:id', to: 'encounters#show', as: 'encounter'


  resources :categories, only: [:show] do
    resources :encounters, only: [:index, :show]
  end

  get '/tags', to: 'tags#index'
  get '/tags/:tag', to:'encounters#index', as: 'tag'


end
