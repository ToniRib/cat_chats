Rails.application.routes.draw do
  root to: 'welcome#index'

  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/conversations', to: 'conversations#index'
  get '/conversation/:id', to: 'conversations#show'
  post '/conversation/:id/messages', to: 'conversations/messages#create'
end
