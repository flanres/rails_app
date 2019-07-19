Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/popular',    to: 'static_pages#popular'
  get    '/recommend',  to: 'static_pages#recommend'
  get    '/signup',     to: 'users#new'
  get    '/search',     to: 'users#show'
  get    '/users/search',     to: 'users#search'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'
  resources :users
  resources :videos
  resources :likes, only: [:create, :destroy]
end
