Rails.application.routes.draw do
  get 'follows/index'
  post 'follows/store/:id', to: 'follows#store', as: 'follows_store'
  delete 'follows/destroy/:id', to: 'follows#destroy', as: 'follows_destroy'
  get 'followers/index'
  post 'likes/store/:id', to: 'likes#store', as: 'likes_store'
  delete 'likes/destroy/:id', to: 'likes#destroy', as: 'likes_destroy'
  get 'feeds/index'
  get 'tweets/index(/:id)', to: 'tweets#index', as: 'tweets_index'
  post 'tweets/store'
  patch 'tweets/update/:id', to: 'tweets#update', as: 'tweets_update'
  delete 'tweets/destroy/:id', to: 'tweets#destroy', as: 'tweets_destroy'
  get 'users/index:id', to: 'users#index', as: 'users_index'
end
