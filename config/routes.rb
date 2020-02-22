Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  resources :follower_projects
  resources :projects do
    resources :articles, only: [:show, :index, :create, :new,:edit, :update, :delete]
  end
  resources :donations, only: [:show, :create] do
    resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  get 'users', to: 'users#index'
  get 'dashboard', to: 'users#dashboard'
  root to: 'users#dashboard'
end
