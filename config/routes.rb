Places::Application.routes.draw do
  resources :interests, :only => [:show]

  resource :geolocation, :only => [:create]
  
  root :to => "interests#index"
end