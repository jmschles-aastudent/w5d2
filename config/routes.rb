SocialThing::Application.routes.draw do

  resources :users do
    # get "circle" => "friend_circles#new"
    member do
      resources :friend_circles, :path => "circles" do
        member do
          resources :memberships, :only => [:create, :destroy]
        end
      end
    end
  end

  get "signup" => "users#new"

  # resources :friend_circles, :only => [:create, :new, :destroy]

  resource :session, :only => [:create, :new, :destroy]
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"

end
