CareConnect::Application.routes.draw do
  
  

  devise_for :users

  root to: 'home#home'

  resources :activities
  resources :events
  resources :messages
  resources :comments
  resources :attendances, only: [:create, :destroy]
  resources :users do 
    put 'approve'
    put 'decline'
  end 



end
