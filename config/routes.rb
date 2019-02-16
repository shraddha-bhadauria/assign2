Rails.application.routes.draw do

  get 'customeroptions/index'
  get 'agentoptions/index'
  get 'options/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions
  resources :agents
  resources :customers


  delete '/logout',  to: 'sessions#destroy'
  get 'welcome/index'
  root :to => redirect('/welcome/index')

end
