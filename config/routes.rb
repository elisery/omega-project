Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :news
    resources :events, only: [:index, :create, :destroy]
    resources :technologies, only: [:index, :create, :destroy]
    resources :organizations
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  resources :companies

  resources :events, only: [:index]

  resources :news

  resource :session, only: [:new, :create, :destroy]
  # resource :about, only: [:new]
  resources :users, only: [:new, :create]

  get('/about', { to: 'about#index' })
  get('/', { to: 'directories#index', as: 'home' })

end
