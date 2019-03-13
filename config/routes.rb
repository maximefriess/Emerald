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


#  Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#                      root GET    /                                                                                        listings#index
#                       faq GET    /faq(.:format)                                                                           pages#faq
#                      user GET    /users/:id(.:format)                                                                     users#show
#        edit_listing_photo GET    /listings/:listing_id/photos/:id/edit(.:format)                                          photos#edit
#             listing_photo PATCH  /listings/:listing_id/photos/:id(.:format)                                               photos#update
#                           PUT    /listings/:listing_id/photos/:id(.:format)                                               photos#update
#                  listings GET    /listings(.:format)                                                                      listings#index
#                   listing GET    /listings/:id(.:format)                                                                  listings#show
#                  messages GET    /messages(.:format)                                                                      messages#index
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)

                                       # active_storage/direct_uploads#create
