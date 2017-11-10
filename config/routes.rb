Rails.application.routes.draw do


  get 'sessions/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/update'

  get 'sessions/edit'

  get 'sessions/destroy'

  get 'sessions/show'

  get 'home/index'

	resources :users
  resources :sessions, except: [:destroy]
  delete '/sessions' => 'sessions#destroy', as: :logout

  resources :posts

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
