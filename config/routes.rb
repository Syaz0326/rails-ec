Rails.application.routes.draw do
  get '/items', to: 'products#index'
  get '/items/:id', to: 'products#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
