Rails.application.routes.draw do
  get "users/verify", to: 'users#show_verify', as: 'verify'
  post "users/verify"
  post "users/resend"

  get '/', to: 'gnomes#index'

  get '/gnomes', to: 'gnomes#index'
  get '/gnome/:id', to: 'gnomes#show', as: 'gnome'

  # resources :gnomes, only: [:index, :show]

  # resources :bucket_gnomes, only: [:create, :update, :destroy]

  post '/bucket_gnomes', to: 'bucket_gnomes#create'
  patch '/bucket_gnomes/:id', to: 'bucket_gnomes#update', as: 'bucket_gnome'
  put '/bucket_gnomes/:id', to: 'bucket_gnomes#update'
  delete '/bucket_gnomes/:id', to: 'bucket_gnomes#destroy'

  # resources :users, only: [:new, :show, :create]

  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'

  # resources :orders, only: [:index, :create, :show]

  get '/orders', to: 'orders#index'
  post '/orders', to: 'orders#create'
  get '/orders/:id', to: 'orders#show', as: 'order'

  get '/bucket' => "bucket#show"
  put '/bucket' => "bucket#update"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  scope module: 'admin'  do
    get 'admin/dashboard', to: 'users#show', as: 'admin/dashboard'

    get 'admin/gnomes', to: 'gnomes#index'
    get 'admin/gnomes/new', to: 'gnomes#new', as: 'new_admin_gnome'
    get 'admin/gnomes/:id', to: 'gnomes#show', as: 'admin_gnome'
    post 'admin/gnomes', to: 'gnomes#create'
    get 'admin/gnomes/:id/edit', to: 'gnomes#edit', as: 'edit_admin_gnome'
    patch 'admin/gnomes/:id', to: 'gnomes#update'
    put 'admin/gnomes/:id', to: 'gnomes#update'

    # resources :gnomes, except: [:destroy]
  end

  get '/:id' => 'categories#show'
  get "*any", via: :all, to: "errors#not_found"
end
