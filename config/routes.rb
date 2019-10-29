Rails.application.routes.draw do
  devise_for :users
  root "courses#index"

  resources :courses

  mount ActionCable.server => '/cable'
end
