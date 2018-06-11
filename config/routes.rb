Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'tank_locations#index'
  
  resources :users

  resources :tank_locations do
    resources :photos, only: [ :create, :destroy] do
      resources :comments, only: [ :create, :destroy ] , module: :photos
    end

    resources :comments, only: [ :create, :destroy ], module: :tank_locations
  end

  put 'photos/:id/like', to: "photos#upvote", as: 'like_photo'
  put 'photos/:id/dislike', to: "photos#downvote", as: 'dislike_photo'
end
