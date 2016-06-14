class Report < ActiveRecord::Base

belongs_to :location
belongs_to :user



# geocoded_by :general_location
# after_validation :geocode

end
