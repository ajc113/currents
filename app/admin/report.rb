ActiveAdmin.register Report do
  belongs_to :user, optional: true
  belongs_to :species, optional: true
  belongs_to :location, optional: true
  config.sort_order = 'date desc'

  permit_params :catch_keepers, :catch_totals, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :best_bait, :trip_description, :lattitude, :longitude, :location_id, :user_id, :date, :species_id
  filter :state, as: :check_boxes
  filter :date
  filter :location, multiple: :true
  filter :primary_method, as: :select
  filter :tide, as: :select
  filter :wind, as: :select
  filter :spot, as: :select
  filter :best_bait, as: :select
  filter :trip_description
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
      input :user, include_blank: false
      input :date, include_blank: false
      input :species, include_blank: false
      input :state, as: :select, include_blank: true, prompt: true, input_html: { class: "state_selection" }
      input :location, as: :select, include_blank: true, prompt: "First select the state", input_html: { class: "location_id" }, collection: {}
      input :catch_keepers, input_html: { style: "width: 100px" }
      input :catch_total, input_html: { style: "width: 100px" }
      input :primary_method, as: :select, include_blank: false, collection: ["Live Bait", "Dead Bait", "Kite", "Jigging", "Popping", "Trolling"]
      input :tide, as: :select, include_blank: false, collection: ["Incoming", "Outgoing", "Slack"]
      input :weather, as: :select, include_blank: false, collection: ["Overcast", "Rain", "Sun", "Fog"]
      input :wind, as: :select, include_blank: false, collection: ['W < 10 mph', 'W 10-20 mph', 'W > 20 mph', 'NW < 10 mph', 'NW 10-20 mph', 'NW > 20 mph','N < 10 mph', 'N 10-20 mph', 'N > 20 mph','NE < 10 mph', 'NE 10-20 mph', 'NE > 20 mph','E < 10 mph', 'E 10-20 mph', 'E > 20 mph', 'SE < 10 mph', 'SE 10-20 mph', 'SE > 20 mph','S < 10 mph', 'S 10-20 mph', 'S > 20 mph','SW < 10 mph', 'SW 10-20 mph', 'SW > 20 mph'] 
      input :spot, as: :string
      input :best_bait, as: :string
      input :trip_description, as: :text, input_html: { rows: 2 }
      input :trip_summary, input_html: { rows: 2 }
      div (image_tag "",  class: 'img-responsive location-legend-image admin', style: 'display:block; opacity: .95'), class: "location-legend-admin-div"
    end
    actions
  end
end
