Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  resources :articles
  resources :users, only: [:show, :new, :create]
  resources :bikes do
    resources :bookings, only: [:show, :new, :create, :index, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
