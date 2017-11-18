Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  # TODO コメントを消す
  # get 'posts' => 'posts#index'
  # get 'posts/new' => 'posts#new'
  #
  # post 'posts' => 'posts#create'
  # get 'posts/:id' => 'posts#show'
  # get 'posts/:id/edit' => 'posts#edit'
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

end
