Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  get "/faq" => "pages#faq"
  resources :users, only: [ :show ]
  resources :listings, only: [ :index, :show ] do
    resources :photos, only: [ :index ]
  end
  resources :photos, only: [ :update ]
  resources :messages, only: [ :index, :show ]

end
