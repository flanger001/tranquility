Rails.application.routes.draw do
  root to: 'static_pages#index'

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  resources :category_collections, only: [:show], path: 'collections'
  resources :staff, only: [:index, :show]

  %w{about policies likes spa_hours specials}.each do |page|
    get page.dasherize, to: "static_pages##{page}"
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
    resources :staff
    resources :users
  end

end

