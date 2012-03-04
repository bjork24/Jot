Jot::Application.routes.draw do
  get "pages/root"

  resources :entries
  root :to => "pages#root"
  match "/auth/twitter/callback" => "sessions#create"
end
