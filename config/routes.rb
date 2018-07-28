Rails.application.routes.draw do
  namespace :admin do
    # resources :news, only: [:create, :destroy]
    # resources :events, only: [:create, :destroy]
    # resources :technologies, only: [:create, :destroy]
    # resources :organizations
    # resources :users, [:edit, :update, :destroy]
  end

  resources :directory do
    resources :companies
  end

  resources :events 

  resources :news

  resource :session, only: [:new, :create, :destroy]
  # resource :about, only: [:new]
  resources :users, only: [:new, :create]

  get('/about', { to: 'about#index' })

end
