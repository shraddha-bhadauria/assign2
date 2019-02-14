Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :sessions


  # resources :cars
  # resources :histories
  # resources :notifications
  # resources :suggestions
  #

  get 'home/index'
  root :to => redirect('/home/index')





end
