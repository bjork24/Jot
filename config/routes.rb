Jot::Application.routes.draw do
  resources :entries
  root :to => "entries#index"
  match "/auth/twitter/callback" => "sessions#create"
end
