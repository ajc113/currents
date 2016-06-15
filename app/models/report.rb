class Report < ActiveRecord::Base

belongs_to :location
belongs_to :user

   def self.for_user user
  
   end

# geocoded_by :general_location
# after_validation :geocode

end
