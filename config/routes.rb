Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  get "/faq" => "pages#faq"
  resources :users, only: [ :show ]
  resources :listings, only: [ :index, :show ] do
    resources :photos, only: [ :edit, :update ]
  end
  resources :messages, only: [ :index ]

end
