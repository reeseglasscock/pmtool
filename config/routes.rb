# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'projects#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :projects do
    delete 'user', to: 'projects#destroy_user'
    resources :posts
  end

  resources :post_comments, only: %i[new create destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
