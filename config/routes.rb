Rails.application.routes.draw do

  root to: 'pages#index'

  get '404', to: 'errors#not_found'
  get '500', to: 'errors#internal_server_error'
  get '403', to: 'errors#forbidden'
  get '422', to: 'errors#bad_request'

  get 'broken', to: 'application#broken'

  get 'policies', to: 'pages#policies'
  get 'spa-hours', to: 'pages#spa_hours'
  get 'specials', to: 'pages#specials'

  resources :reviews, only: [:index, :show]
  resources :recommendations, only: [:index]
  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end
  resources :category_collections, only: [:show], path: 'collections'
  resources :staff, only: [:index, :show]

  get 'about', to: 'staff#index'

  resources :sessions
  get 'login', to: 'sessions#new'
  match 'logout', to: 'sessions#destroy', via: [:get, :post]

  namespace :admin do
    resources :categories, :category_collections, :products, :recommendations, :reviews, :schedules, :snippets, :snippet_collections, :staff, :users do
      collection do
        post 'active'
      end
      member do
        post 'move_up'
        post 'move_down'
        post 'move_to_top'
        post 'move_to_bottom'
      end
    end
  end

end

