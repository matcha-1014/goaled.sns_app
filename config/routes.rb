Rails.application.routes.draw do
  get "/login" => "users#login_form"
  post "/login" => "users#login"
  post "/logout" => "users#logout"
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/create" => "users#create"
  get "posts/index"
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id/show" => "posts#show"
  get "posts/:id/destroy" => "posts#destroy"
  get "posts/new" => "posts#new"
  get "/" => "home#top"
  post "posts/create" => "posts#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
