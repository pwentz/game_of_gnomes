Rails.application.routes.draw do
  get '/', to: 'gnomes#index'

  resources :gnomes, only: [:index, :show]

  resources :categories, only: [:show]
  resources :bucket_gnomes, only: [:create]
  #resources :bucket, only: [:show, :update]

  resources :users, only: [:new, :show, :create]

  get '/bucket' => "bucket#show"
  put '/bucket' => "bucket#update"

  get '/login', to: 'sessions#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'
end
