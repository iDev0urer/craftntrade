Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'static#index'

  get '/auction',       to: 'auctions#index', as: 'auction_index'
  match '/auction/new', to: 'auctions#create', as: 'create_auction', via: [:post]
  match '/auction/delete', to: 'auctions#delete', as: 'delete_auction', via: [:delete]
  get '/auction/show', to: 'auctions#show', as: 'auction_show'
  get '/auction/search', to: 'auctions#search', as: 'auction_search'


end
