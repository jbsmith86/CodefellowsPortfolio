Portfolio::Application.routes.draw do


  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  scope ":locale" do
    resources :posts
  end
  resources :comments
  resources :projects

  get "welcome/index"
  root 'welcome#index'

end
