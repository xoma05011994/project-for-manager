SlobodaDoc::Application.routes.draw do

root :to => 'projects#index'

resources :projects
resources :clients
resources :managers
resources :programmers


end
