CareConnect::Application.routes.draw do
  
  root to: 'home#home'

  resources :events
  resources :messages
  resources :users



end
