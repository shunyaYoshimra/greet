Rails.application.routes.draw do
  get 'users/index'
  resources :profiles, only: [:new, :create, :edit, :update]
  devise_for :users
  root to: 'home#top'
end
