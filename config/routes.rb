Rails.application.routes.draw do
  root 'profile#home'
  
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users do 
    resources :boards
  end
  # resources :boards do
    resources :tasks
  # end
  

end
