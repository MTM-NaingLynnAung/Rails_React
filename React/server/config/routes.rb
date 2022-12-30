Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'login', to: 'sessions#login'
  post 'register', to: 'users#create'
  delete 'logout', to: 'sessions#logout'
end
