# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :foods, only: %i[index show new create destroy] do
      resources :recipes, only: %i[index show]
    end

    resources :recipes, only: %i[index show new create destroy] do
      resources :recipes, only: %i[index show]
    end
  end
end
