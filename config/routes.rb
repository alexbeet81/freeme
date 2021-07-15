Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :skills, only: [:create]
    resources :projects, only: [:create]
    resources :experiences, only: [:create]
    get "/profile", to: "users#profile"
  end
  resources :skills, only: [:update, :destroy]
  resources :projects, only: [:update, :destroy]
  resources :experiences, only: [:update, :destroy]
end
