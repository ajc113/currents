ActiveAdmin.register Report do
  belongs_to :user, optional: true
  belongs_to :species, optional: true

  form partial: 'reports/form'

  permit_params :catch_keepers, :catch_totals, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :best_bait, :trip_description, :lattitude, :longitude, :location_id, :user_id, :date, :species_id
  remove_filter :state
  index do
    selectable_column
    actions
    column :user_id
    column :date
    column :location
    column :species
    column :catch_keepers
    column :catch_total
    column :trip_summary
    column :primary_method
    column :tide
    column :wind
    column :spot
    column :best_bait
    column :trip_description
  end

  #form do |f|
    #inputs do
      #input :date
      #input :species
      #input :state, as: :select, include_blank: false
      #input :location
      #input :catch_keepers
      #input :trip_summary
      #input :catch_total
      #input :primary_method
      #input :tide
      #input :weather
      #input :wind
      #input :spot
      #input :best_bait
      #input :trip_description
    #end
  #end
end


#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
