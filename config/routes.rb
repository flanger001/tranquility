Rails.application.routes.draw do

  root to: 'pages#index'

  get '404', to: 'errors#not_found'
  get '500', to: 'errors#internal_server_error'
  get '403', to: 'errors#forbidden'
  get '422', to: 'errors#bad_request'

  get 'broken', to: 'application#broken'

  get 'spa-hours', to: 'pages#spa_hours'

  get 'no_u_cannot_haz', to: 'pages#no_u_cannot_haz'
  get 'the_fish', to: 'pages#the_fish'

  resources :reviews, only: [:index, :show]
  resources :recommendations, only: [:index]
  resources :categories, only: [:index, :show], shallow: true do
    resources :products, only: [:index, :show]
  end
  resources :category_collections, only: [:show], path: 'collections'
  resources :staff, only: [:index, :show]

  get 'about', to: 'staff#index'

  resources :sessions
  get 'login', to: 'sessions#new'
  match 'logout', to: 'sessions#destroy', via: [:get, :post]

  concern :active do
    collection do
      post 'active'
    end
  end

  concern :list_repositionable do
    member do
      post 'move_up'
      post 'move_down'
      post 'move_to_top'
      post 'move_to_bottom'
    end
  end

  namespace :admin do
    resources :categories,
              :category_collections,
              :products,
              :recommendations,
              :reviews,
              :schedules,
              :snippets,
              :snippet_collections,
              :staff,
              :users,
              concerns: [:active, :list_repositionable]
  end
end
