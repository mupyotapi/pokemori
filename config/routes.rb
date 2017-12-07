  Rails.application.routes.draw do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root 'products#index'
    resources :products do                  #products_controllerに対してのresourcesメソッド
      resources :reviews, only: [:new,:create]
    end
    resources :users, only: [:show]       #users_controllerに対してのresourcesメソッド

  end

