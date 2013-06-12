SocialThing::Application.routes.draw do

  # resources :users do
  #   # get "circle" => "friend_circles#new"
  #   member do
  #     resources :friend_circles, :path => "circles" do
  #       member do
  #         resources :memberships, :only => [:create, :destroy]
  #       end
  #     end
  #   end
  # end

  resources :users do
    member do
      get "feed" => "posts#index"
    end
  end

  resources :friend_circles, :path => "circles" do
    member do
      resources :memberships, :only => [:create, :destroy]
    end
  end

  resources :posts do
    member do
      resources :post_shares, :only => [:create, :destroy]
      resources :links, :only => [:create, :destroy]
    end
  end

  resource :session, :only => [:create, :new, :destroy]
  get "signup" => "users#new"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"

end
