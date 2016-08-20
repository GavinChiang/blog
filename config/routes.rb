Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users

  resources :categories

  resources :posts do
    resources :comments
  end
  
  resources :contacts, only: [:new, :create]

  root "posts#index"

  get'/about', to: 'pages#about'
end
