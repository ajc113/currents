class Report < ActiveRecord::Base

belongs_to :location
belongs_to :user

	def catch_keepers_plus_catch_total
		self.catch_keepers + self.catch_total
	end

	def self.target_tuna
		Report.where(target_species: 'Tuna')
	end

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
