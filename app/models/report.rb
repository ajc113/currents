class Report < ActiveRecord::Base

geocoded_by :general_location
after_validation :geocode

end
