Rails.application.routes.draw do
  get '/portfolios', to: 'portfolios#index'
end
