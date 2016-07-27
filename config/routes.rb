Rails.application.routes.draw do
  get '/', to: 'gnomes#index'

  resources :gnomes, only: [:index, :show]

  resources :categories, only: [:show]
  resources :bucket_gnomes, only: [:create]
  resources :bucket, only: [:show]
end
