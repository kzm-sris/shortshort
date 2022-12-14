Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about'=>'homes/about',as: 'about'

  resources :post_books, only: [:new, :index, :show,:create,:destroy] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show,:edit,:update] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
