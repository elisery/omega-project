Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :news, only: [:index, :create, :destroy]
    resources :events, only: [:index, :create, :destroy]
    resources :technologies, only: [:index, :create, :destroy]
    resources :organizations
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  resources :directory 

  resources :events, only: [:index]

  resources :news

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get('/about', { to: 'about#index' })

end
