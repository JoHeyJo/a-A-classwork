Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:create, :destroy, :show, :index, :update]

  resources :artworks, only:[:create, :destroy, :show, :index, :update]



  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/new', to: 'users#new', as: 'new_user'
end
