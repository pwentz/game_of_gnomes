Rails.application.routes.draw do

  resources :gnomes, only: [:index]

  resources :categories, only: [:show]
end
