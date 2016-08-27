Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users

  resources :categories

  resources :posts

  namespace :admin do
  	resources :posts
    resources :users do 
      member do
        post :to_admin
        post :to_normal
      end
    end
  end
  
  resources :contacts, only: [:new, :create]

  root "posts#index"

  get'/about', to: 'pages#about'
end
