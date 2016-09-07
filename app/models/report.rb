class Report < ActiveRecord::Base

belongs_to :location
belongs_to :user



	scope :target_tuna, -> { Report.where(target_species: 'Tuna') }

	scope :selected_species, -> (the_species) { where(target_species: the_species)}

	scope :selected_location, -> (the_location) { where(location: the_location )}

	scope :selected_tide, -> (the_tide) {where(tide: the_tide)}

	scope :selected_date, -> (month) {where("cast(strftime('%m', date) as int) = ?", month)}



  def location_json
    f = File.read self.location.coordinate_file.path
    # puts "f is #{f.inspect}".green
    # # f = f[0]
    # puts "f[0] is #{f}".blue
    # location_json = JSON.parse(f)
    # puts "location_json is #{location_json}".green
    # return location_json
    f
  end
# by_star_field :date

# filterrific(
# 	  default_filter_params: { sorted_by: 'created_at_desc' },
# 	  available_filters: [
# 	    :sorted_by,
# 	    :search_query,
# 	    :with_target_species,
# 	    :select_options,
# 	  ]
# 	)



#    	scope :with_target_species, lambda { |target_species| where(:target_species => target_species) }  



#  def self.options_for_sorted_by
#     [
#       ['target_species (a-z)', 'target_species_asc'],
#       ['date (newest first)', 'created_at_desc'],
#       ['location_id', 'location_id_asc']
#     ]
#  end
# def self.options_for_select
# end

# def self.for_user user
# end

# # geocoded_by :general_location
# # after_validation :geocode
end
