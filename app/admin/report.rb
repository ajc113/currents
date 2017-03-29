ActiveAdmin.register Report do
  belongs_to :user, optional: true
  belongs_to :species, optional: true

  permit_params :catch_keepers, :catch_totals, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :best_bait, :trip_description, :lattitude, :longitude, :location_id, :user_id, :date, :species_id

  index do
    selectable_column
    actions
    column :user_id
    column :date

    column "Location" do |location_id|
      Location.find(location_id).short_name
    end

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