Rails.application.routes.draw do
  get '/portfolios', to: 'portfolios#index'
  get '/portfolios/new', to: 'portfolios#new'
  post '/portfolios', to: 'portfolios#create'
  get '/portfolios/:portfolio_id', to: 'portfolios#show'
end
