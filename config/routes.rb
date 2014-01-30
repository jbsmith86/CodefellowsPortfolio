Portfolio::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :posts
  resources :comments
  resources :projects

  get "welcome/index"
  root 'welcome#index'

end
