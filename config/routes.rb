UrlShortener::Application.routes.draw do
  root :to => "urls#new"

  resources :urls, only: [:create, :new]
  resources :users, only: [:create, :new]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create, :new]
  get "/:id", to: "urls#unshorten", as: :unshorten_url
end
