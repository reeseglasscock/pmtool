# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :users
  resources :projects do
    delete 'user', to: 'projects#destroy_user'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
