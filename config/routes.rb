Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    namespace :admin do
      resources :users do
        resources :reports
      end
    end
  devise_for :users, sign_out_via: [:get, :delete], :controllers => { :registrations => 'users/registrations' }

  root to: 'currents#index'

  # :registrations => "users/registrations"
  resources :intels 
  resources :locations
  resources :buzzs
  resources :reports
  resources :maps
  resources :currents
  resources :invoices, only: [:index, :show]
  resources :posts do
  resources :comments


  end
  resource :card
  put 'subscribe', to: 'subscribe#create'
  # resources :tags, only: [:index, :show]


  resource :my_account, only: [:show, :destroy], controller: 'my_account'
  post 'stripe_events', to: 'stripe#events', as: 'stripe_events'

  #Data API
  get 'species_filter', to: 'maps#filter_by_species', as: :species_filter
  get 'reports_of_location', to: 'maps#reports_of_location', as: :reports_of_location, format: 'json'
  get 'locations_for_state', to: 'reports#locations_for_state', as: :locations_for_state

  #Static Pages
  get 'about', to: 'currents#about'
  get 'blog', to: 'currents#blog'
  get 'rules', to: 'currents#rules'
  get 'pricing', to: 'currents#pricing'
  get 'tags/:tag', to: 'posts#tag', as: :tag
  #Extra
  get 'test', to: 'currents#test'
  get 'tag', to: 'posts#tag'
end
