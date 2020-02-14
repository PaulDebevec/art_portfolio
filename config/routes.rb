Rails.application.routes.draw do
  get '/portfolios', to: 'portfolios#index'
  get '/portfolios/:portfolio_id', to: 'portfolios#show'
end
