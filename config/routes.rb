Rails.application.routes.draw do
  root "courses#index"

  resources :courses

  mount ActionCable.server => '/cable'
end
