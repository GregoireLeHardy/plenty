Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  resources :users, only: [:show, :new, :create]
  resources :projects do
    resources :articles, only: [:show, :index, :create, :new, :update, :delete]
    resources :donations, only: [:show, :create] do
      resources :payments, only: :new
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
