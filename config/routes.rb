Rails.application.routes.draw do
  get 'tags/index'
  get 'categories/show'
  get 'encounters/new'
  get 'encounters/create'
  get 'encounters/edit'
  get 'encounters/update'
  get 'encounters/index'
  get 'encounters/show'
  get 'users/show'
  devise_for :users, :path => 'accounts', :controllers  => {:omniauth_callbacks => "users/omniauth_callbacks"}

  root 'dashboard#index'

  resources :users, only: [:show] do
    resources :encounters, only: [:new, :edit, :update, :index, :show]
  end

  get '/encounters', to: 'encounters#index', as: 'encounters'
  get '/encounters/:id', to: 'encounters#show', as: 'encounter'


  resources :categories, only: [:show] do
    resources :encounters, only: [:index, :show]
  end

  get '/tags', to: 'tags#index'
  get '/tags/:tag', to:'encounters#index', as: 'tag'


end
