UrlShortener::Application.routes.draw do
  root :to => "urls#new"

  resources :urls, only: [:create, :new]
end
