ActiveAdmin.register Report do
  belongs_to :user, optional: true
  belongs_to :species, optional: true

  permit_params :catch_keepers, :catch_totals, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :best_bait, :trip_description, :lattitude, :longitude, :location_id, :user_id, :date, :species_id
  remove_filter :state
  index do
    selectable_column
    actions
    column :user
    column :date
    column :state
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

  form do |f|
    inputs do
      input :user
      input :date
      input :species
      input :state, as: :select, include_blank: false
      input :location
      input :catch_keepers
      input :trip_summary
      input :catch_total
      input :primary_method, as: :select, collection: ["Live Bait", "Dead Bait", "Kite", "Jigging", "Popping", "Trolling"]
      input :tide, as: :select, collection: ["Incoming", "Outgoing", "Slack"]
      input :weather, as: :select, collection: ["Overcast", "Rain", "Sun", "Fog"]
      input :wind, as: :select, collection: ['W < 10 mph', 'W 10-20 mph', 'W > 20 mph', 'NW < 10 mph', 'NW 10-20 mph', 'NW > 20 mph','N < 10 mph', 'N 10-20 mph', 'N > 20 mph','NE < 10 mph', 'NE 10-20 mph', 'NE > 20 mph','E < 10 mph', 'E 10-20 mph', 'E > 20 mph', 'SE < 10 mph', 'SE 10-20 mph', 'SE > 20 mph','S < 10 mph', 'S 10-20 mph', 'S > 20 mph','SW < 10 mph', 'SW 10-20 mph', 'SW > 20 mph'] 
      input :spot
      input :best_bait
      input :trip_description
    end
    actions
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
