Rails.application.routes.draw do
  root to: 'welcome#index'

  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/conversations', to: 'conversations#index'
end
