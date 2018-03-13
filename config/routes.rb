Rails.application.routes.draw do
  resources :users
  get 'signup' => 'users#new'
  resource :session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
end
