# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  root 'home#index'
end
