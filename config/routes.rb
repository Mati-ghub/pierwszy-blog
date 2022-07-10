Rails.application.routes.draw do
  resources :posts
  devise_for :users
    root "articles#index"
    get "/articles", to: "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
