Rails.application.routes.draw do

  get 'categories/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'static#index'

  get '/auction',       to: 'auctions#index', as: 'auction_index'
  get 'auction/:id',    to: 'auctions#show', as: 'show_auction'
  match '/auction/new', to: 'auctions#new', as: 'create_auction', via: [:post]
  match '/auction/delete', to: 'auctions#delete', as: 'delete_auction', via: [:delete]


  ## ## ## ## ## ## ## ## ##
  ## ##       API      ## ##
  ## ## ## ## ## ## ## ## ##

  get '/api/auction/show', to: 'auctions#json_show', as: 'api_auction_show'
  get '/api/auction/json_search', to: 'auctions#json_search', as: 'api_auction_search'


end
