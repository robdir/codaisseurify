Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :users
  resources :artists
  resources :songs
end
