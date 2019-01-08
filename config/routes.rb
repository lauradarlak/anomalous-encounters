Rails.application.routes.draw do

  devise_for :users, :path => 'accounts', :controllers  => {:omniauth_callbacks => "users/omniauth_callbacks"}

  root 'dashboard#index'

  # resources :user, only: [] do
  #   resources :encounters, only: [:new, :create, :edit, :update, :index]
  # end

  scope ':display_name', as: 'user' do
    resources :encounters
  end

  get '/encounters', to: 'encounters#index'
  get '/encounters/:id', to: 'encounters#show', as: 'encounter'

  resources :categories, only: [:show] do
    resources :encounters, only: [:index, :show]
  end

  get '/tags', to: 'tags#index'
  get '/tags/:name', to:'tags#show', as: 'tag'


end
