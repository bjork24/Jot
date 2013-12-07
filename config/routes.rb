Jot::Application.routes.draw do
  resources :events

  get "pages/root"

  resources :entries
  root :to => "pages#root"
  match "/auth/twitter/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  match '/entries/new/:year/:month/:day' => 'entries#new'
  match '/entries/new/(*other)' => redirect("/entries")
  
  match '/entries/:month/:day' => 'entries#show'
  match '/entries/:year/:month/:day' => 'entries#show'
  
  match '/search/:query' => 'entries#search'
  match '/search/:field/:query' => 'entries#search'

  match '/export' => 'export#show'
  
end
