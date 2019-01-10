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
  get '/encounters/recent_encounters', to: 'encounters#recent_encounters', as: 'most_recent_encounters'

  resources :categories, only: [:show], param: :slug do
    resources :encounters, only: [:index, :show]
  end

  get '/tags', to: 'tags#index'
  get '/tags/:name', to:'tags#show', as: 'tag'


end
