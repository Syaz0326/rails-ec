Rails.application.routes.draw do
  get '/items', to: 'products#index', as: 'items'
  get '/items/:id', to: 'products#show', as: 'item'
  get '/items/:id/reviews', to: 'reviews#index', as: 'reviews'
  post '/items/:id/reviews', to: 'reviews#create', as: 'post_review'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
