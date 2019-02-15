Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions
  resources :agents
  resources :customers

  get 'welcome/index'
  root :to => redirect('/welcome/index')

end
