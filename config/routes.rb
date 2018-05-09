Rails.application.routes.draw do

  # get 'users/new'

  # get 'users/create'

  # get 'users/show'

  # get 'users/destroy'

  devise_for :users
  root to: 'tank_locations#index'

  resources :tank_locations do
    resources :photos only: [ :create, :destroy] do
      resources :comments only: [ :create, :destroy ] , module: :photos
    end

    resources :comments, module: :tank_locations
  end

  resources :photos do 
     member do
       put "like", to: "photos#upvote"
       put "dislike", to: "photos#downvote"
     end
  end 

end
