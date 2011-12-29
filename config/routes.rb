Radmad::Application.routes.draw do


  match 'user_sessions/new' => 'user_sessions#new', :as => :login
  match 'user_sessions/logout' => 'user_sessions#logout', :as => :logout
  match 'users/myday' => 'users#myday', :as => :myday
  match 'users/myprofile' => 'users#myprofile', :as => :myprofile
  match 'users/show/:id' => 'users#show'

  resources :user_sessions
  resources :users

  root :to => "user_sessions#new"  

end
