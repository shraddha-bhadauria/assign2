Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions
  resources :agents
  resources :customers
  resources :options
  resources :customeroptions
  resources :agentoptions
  resources :tours
  resources :reviews



  delete '/logout',  to: 'sessions#destroy'
  get 'welcome/index'
  root :to => redirect('/welcome/index')

end
