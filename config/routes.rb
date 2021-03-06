Rails.application.routes.draw do


  get 'home/index'

	resources :users
  resources :sessions, except: [:destroy]
  delete '/sessions' => 'sessions#destroy', as: :logout

  resources :posts do
  	resources :comments
  end

  resources :comments do
  	resources :comments
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
