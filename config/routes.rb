Places::Application.routes.draw do
  resources :interests, :only => [:show]
  
  root :to => "interests#index"
end