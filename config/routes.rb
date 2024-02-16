# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: %i[create destroy]

    member do
      patch 'upvote', to: 'posts#upvote'
    end
  end

  root 'posts#index'
end
