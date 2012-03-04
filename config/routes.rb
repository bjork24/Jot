Jot::Application.routes.draw do
  get "pages/root"

  resources :entries
  root :to => "pages#root"
  match "/auth/twitter/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end
