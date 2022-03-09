Rails.application.routes.draw do
  resources :users, only: [ :show, :edit, :update]
  # 以下を略
  # get 'users/show'
  # get 'users/edit'
  devise_for :users
  root to: 'homes#top'
  get "homes/about",as: "about"

  resources :post_images, only: [ :new, :create, :index, :show , :destroy]
  # 以下を略
  # get "post_images/new"
  # get "post_images/index"
  # get "post_images/show"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
