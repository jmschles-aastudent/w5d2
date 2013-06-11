SocialThing::Application.routes.draw do

  resources :users
  get "signup" => "users#new"

  resource :session, :only => [:create, :new, :destroy]
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"

end
