  Rails.application.routes.draw do
    devise_for :users
    root 'products#index'
    resources :products do                  #products_controllerに対してのresourcesメソッド
      resources :reviews, only: [:create]
    end
    resources :users, only: [:show]       #users_controllerに対してのresourcesメソッド

  end

