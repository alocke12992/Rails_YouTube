Rails.application.routes.draw do

  get 'playlists/index'

  get 'playlists/show'

  get 'playlists/new'

  get 'playlists/edit'

  devise_for :users
  root 'movies#index'
  get "/genre/:genre", to: "movies#show_genre", as: "genre"


  resources :accounts do
    member do
      get :add_comment
      get :add_comment_to_account
    end
  end


  resources :movies do
    resources :comments
  end

end
