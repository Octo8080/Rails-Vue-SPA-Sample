Rails.application.routes.draw do
  root 'spa#index'
  resources :users,only: [:index, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'sessions', to: 'sessions#create'
  post 'sessions/islogin', to: 'sessions#islogin'
  delete 'sessions', to: 'sessions#destroy'
end
