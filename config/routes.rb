Places::Application.routes.draw do
  resources :interests, :only => [:show] do
    resources :locations, :only => [:show], :shallow => true
  end

  resource :geolocation, :only => [:create]
  
  root :to => "interests#index"
end