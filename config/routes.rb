Rails.application.routes.draw do

  devise_for :users, :path => 'accounts', :controllers  => {:omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations", :sessions => "users/sessions"}

  match '/accounts/:id/finish-signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root 'encounters#recent_encounters'

  scope ':display_name', as: 'user' do
    resources :encounters
  end

  resources :categories, only: [:index, :show], param: :slug


  get '/tags', to: 'tags#index'
  get '/tags/:name', to:'tags#show', as: 'tag'


end
