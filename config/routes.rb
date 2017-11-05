Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'posts' => 'posts#index'
  get 'posts/:id' => 'posts#show'
end
