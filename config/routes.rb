Rails.application.routes.draw do

  root to: "pages#index"

  get "404", to: "errors#not_found"
  get "500", to: "errors#internal_server_error"
  get "403", to: "errors#forbidden"
  get "400", to: "errors#bad_request"

  get "contact_us", to: "pages#contact_us"
  get "newsletter_signup", to: "pages#newsletter_signup"

  resources :reviews, only: [:index, :show]
  resources :recommendations, only: [:index]
  resources :categories, only: [:index, :show], param: :url, shallow: true do
    resources :products, only: [:index, :show], param: :url
  end
  resources :category_collections, only: [:show], param: :url, path: "collections"
  resources :staff, only: [:index, :show], param: :url

  get "about", to: "staff#index"

  resources :sessions
  get "login", to: "sessions#new"
  match "logout", to: "sessions#destroy", via: [:get, :post]

  concern :active do
    collection do
      post "active"
    end
  end

  concern :list_repositionable do
    member do
      post "move_up"
      post "move_down"
      post "move_to_top"
      post "move_to_bottom"
    end
  end

  namespace :admin do
    resources :recommendations,
      :reviews,
      :schedules,
      :snippets,
      :snippet_collections,
      :users,
      concerns: [:active, :list_repositionable]

    resources :categories,
      :category_collections,
      :products,
      :staff,
      concerns: [:active, :list_repositionable],
      param: :url
  end
end
