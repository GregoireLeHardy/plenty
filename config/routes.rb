Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  resources :users, only: [:show, :new, :create] do
    resources :follower_projects
  end
  resources :projects do
    resources :articles, only: [:show, :index, :create, :new, :update, :delete]
  end
  resources :donations, only: [:show, :create] do
    resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
