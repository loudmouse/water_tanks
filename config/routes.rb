Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/destroy'

  get 'photos/create'

  get 'photos/destroy'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get 'users/destroy'

  devise_for :users
  root to: 'tank_locations#index'

  resources :tank_locations
  resources :photos
end
