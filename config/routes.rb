Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/destroy'

  get 'tank_locations/new'

  get 'tank_locations/create'

  get 'tank_locations/edit'

  get 'tank_locations/destroy'

  get 'tank_locations/show'

  get 'tank_locations/index'

  get 'photos/create'

  get 'photos/destroy'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get 'users/destroy'

  devise_for :users
  root to: 'users#show'

  resources :tank_locations
end
