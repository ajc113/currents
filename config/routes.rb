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

  #Data API
  get 'species_filter', to: 'maps#filter_by_species', as: :species_filter
  get 'locations_for_state', to: 'reports#locations_for_state', as: :locations_for_state

  #Statick Pages
  get 'about', to: 'currents#about'
  get 'blog', to: 'currents#blog'
  get 'rules', to: 'currents#rules'
   get 'pricing', to: 'currents#pricing'

  #Extra
  get 'test', to: 'currents#test'

end
