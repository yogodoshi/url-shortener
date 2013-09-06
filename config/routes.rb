UrlShortener::Application.routes.draw do
  root :to => "urls#new"

  resources :urls, only: [:create, :new]
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create, :new]
  get "/:id", to: "urls#unshorten", as: :unshorten_url
end
