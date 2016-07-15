Rails.application.routes.draw do
  devise_for :users

  resources :categories

  resources :posts do
    resources :comments
  end
  
  resources :contacts, only: [:new, :create]

  root "posts#index"

  get'/about', to: 'pages#about'
end
