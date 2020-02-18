Rails.application.routes.draw do
  get '/portfolios', to: 'portfolios#index'
  get '/portfolios/new', to: 'portfolios#new'
  post '/portfolios', to: 'portfolios#create'
  get '/portfolios/:portfolio_id', to: 'portfolios#show'
  get '/portfolios/:portfolio_id/edit', to: 'portfolios#edit'
  patch '/portfolios/:portfolio_id', to: 'portfolios#update'
  delete '/portfolios/:portfolio_id', to: 'portfolios#destroy'
end
