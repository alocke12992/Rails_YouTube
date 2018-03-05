Rails.application.routes.draw do

  

  devise_for :users
  root 'movies#index'

  resources :movies
  # resources :comments
  resources :accounts do 
    resources :playlists 
  end 

  resources :accounts do
    member do
      get :add_comment
      get :add_comment_to_account
    end
  end

  # scope'movies/:movie_id', as: 'movie' do
  #
  #   resources :comments, only: [:new, :create]
  # end

  resources :movies do
    resources :comments
  end

end
