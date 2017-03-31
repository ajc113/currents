Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    namespace :admin do
      resources :users do
        resources :reports
      end
    end
  devise_for :users
  root to: 'currents#index'

  # :registrations => "users/registrations"

  resources :locations
  resources :buzzs
  resources :reports
  resources :users
  resources :maps
  resources :currents

  get 'filter', to: 'reports#filter'

  #Data API
  get 'species_filter', to: 'maps#filter_by_species', as: :species_filter

  #Statick Pages
  get 'about', to: 'currents#about'
  get 'blog', to: 'currents#blog'
  get 'rules', to: 'currents#rules'


  #Extra
  get 'test', to: 'currents#test'

end
