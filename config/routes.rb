CareConnect::Application.routes.draw do
  
  devise_for :users

  root to: 'home#home'

  resources :events
  resources :messages
  resources :users



end
