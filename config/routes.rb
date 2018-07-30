Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :news
    post '/admin/news', to: '/admin/news#index'
    resources :events, only: [:index, :create, :destroy]
    post '/admin/events', to: '/admin/events#index'
    resources :technologies, only: [:index, :create, :destroy]
    post '/admin/technologies', to: '/admin/technologies#index'
    resources :organizations, only: [:index, :destroy]
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

