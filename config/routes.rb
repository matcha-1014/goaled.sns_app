Rails.application.routes.draw do
  get 'users/index' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  get 'posts/index'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id/show' => 'posts#show'
  get 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/new' => 'posts#new'
  get '/' => "home#top"
  post 'posts/create' => 'posts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
