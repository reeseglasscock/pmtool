# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'projects#index'

devise_for :users, skip: [:sessions], controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  as :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    post 'sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  # devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :projects do
    delete 'user', to: 'projects#destroy_user'
    resources :posts
  end

  resources :comments, only: %i[new create destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
