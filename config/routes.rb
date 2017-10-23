Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :users

  resources :artists do
  resources :songs
end

namespace :api do
  resources :artists do
    resources :songs
    end
  end

end
