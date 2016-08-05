Rails.application.routes.draw do
  get "users/verify", to: 'users#show_verify', as: 'verify'
  post "users/verify"
  post "users/resend"

  get '/', to: 'gnomes#index', as: 'root'

  get '/gnomes', to: 'gnomes#index', as: 'gnomes'
  get '/gnomes/:id', to: 'gnomes#show', as: 'gnome'

  post '/bucket_gnomes', to: 'bucket_gnomes#create', as: 'bucket_gnomes'
  put '/bucket_gnomes/:id', to: 'bucket_gnomes#update', as: 'bucket_gnome'
  delete '/bucket_gnomes/:id', to: 'bucket_gnomes#destroy'

  

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create', as: 'users'
  

  get '/orders', to: 'orders#index', as: 'orders'
  post '/orders', to: 'orders#create'
  get '/orders/:id', to: 'orders#show', as: 'order'


  get '/bucket' => "bucket#show", as: 'bucket'
  put '/bucket' => "bucket#update"

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'sessions'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/dashboard', to: 'users#show', as: 'dashboard'

  get 'admin/dashboard', to: 'admin/users#show', as: 'admin_dashboard'
  get 'admin/gnomes', to: 'admin/gnomes#index', as: 'admin_gnomes'
  get 'admin/gnomes/new', to: 'admin/gnomes#new', as: 'new_admin_gnome'
  post 'admin/gnomes', to: 'admin/gnomes#create'
  get 'admin/gnomes/:id', to: 'admin/gnomes#show', as: 'admin_gnome'
  get 'admin/gnomes/:id/edit', to: 'admin/gnomes#edit', as: 'edit_admin_gnome'
  put 'admin/gnomes/:id', to: 'admin/gnomes#update'
  patch 'admin/gnomes/:id', to: 'admin/gnomes#update'

  get '/:id' => 'categories#show', as: 'category'
  get "*any", via: :all, to: "errors#not_found"
end
