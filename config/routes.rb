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
  resources :spots
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
  get 'vhf', to: 'currents#vhf'
  get 'rules', to: 'currents#rules'
  get 'pricing', to: 'currents#pricing'
  get 'tags/:tag', to: 'posts#tag', as: :tag
  get 'spotter', to: 'intels#spotter'
  
  # Spots Pages
  get 'ma_inshore', to: 'spots#ma_inshore'
  get 'east_of_chatham', to: 'spots#east_of_chatham'
  get 'gulf_of_maine', to: 'spots#gulf_of_maine'
  get 'south_of_vineyard', to: 'spots#south_of_vineyard'
  get 'boat_ramps', to: 'spots#boat_ramps'


    #Extra
  get 'test', to: 'currents#test'
  get 'tag', to: 'posts#tag'
end
