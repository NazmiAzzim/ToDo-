Rails.application.routes.draw do
  
  get 'users/show'

  get 'password_resets/new'

  resources :todo_lists do
  resources :todo_items do
  	member do
  		patch :complete
  	end
  end
  end
   devise_for :users
   devise_scope :user do
  authenticated :user do
    root 'todo_lists#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
resources :password_resets
resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

