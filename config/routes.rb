CareConnect::Application.routes.draw do
  
  devise_for :users

  root to: 'home#home'

  resources :events
  resources :messages
  resources :users do 
    put 'approve'
    put 'decline'
  end 



end
