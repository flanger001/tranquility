Rails.application.routes.draw do
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  get '/403', to: 'errors#forbidden'
  get '/422', to: 'errors#bad_request'

  root to: 'pages#index'

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end
  get 'reviews', to: 'pages#reviews'

  resources :category_collections, only: [:show], path: 'collections'
  resources :staff, only: [:index, :show]

  %w{about policies likes spa_hours specials}.each do |page|
    get page.dasherize, to: "pages##{page}"
  end

  resources :sessions
  get 'login', to: 'sessions#new'
  match 'logout', to: 'sessions#destroy', via: [:get, :post]

  namespace :admin do
    resources :categories
    resources :category_collections
    resources :products
    resources :reviews
    resources :schedules
    resources :snippets
    resources :snippet_collections
    resources :staff
    resources :users
  end

end

