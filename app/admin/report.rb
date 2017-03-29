ActiveAdmin.register Report do


  permit_params :user_id, :short_name



  index do
    selectable_column
    actions
    column :user_id
    column :date


    column "Species" do |species_id|
    	Species.find(species_id).name
    end
    column :catch_keepers
    column :catch_total
    column :trip_summary
    column :primary_method
    column :tide
    column :wind
    column :spot
    column :best_bait
    column :trip_description
    column :created_at
    column :updated_at
    column :latitude
    column :longitude
    column :location_id

  end




end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
