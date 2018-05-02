Rails.application.routes.draw do

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get 'users/destroy'

  devise_for :users
  root to: 'tank_locations#index'

  resources :tank_locations do
    resources :photos do
      resources :comments, module: :photos
    end
    resources :comments, module: :tank_locations
  end


end
