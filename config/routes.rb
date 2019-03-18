Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  get "/faq" => "pages#faq"
  resources :users, only: [ :show, :update ]
  resources :listings, only: [ :index, :show ] do
    resources :photos, only: [ :index ]
    resources :bookings, only: [ :index, :show ]
  end
  resources :photos, only: [ :update ]
  resources :messages, only: [ :index, :show ]

  namespace :admin do
    resources :users
    resources :listings, except: [ :show ] do
      resources :photos, only: [ :index, :create, :destroy ]
    end
    resources :messages, only: [ :index, :new, :create, :destroy  ]
  end

end
