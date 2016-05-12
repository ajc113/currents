class Location < ActiveRecord::Base
	
   attr_accessor :lat1, :lng1
   attr_accessor :lat2, :lng2
   attr_accessor :lat3, :lng3
   attr_accessor :lat4, :lng4
   attr_accessor :lat5, :lng5
   attr_accessor :lat6, :lng6
   attr_accessor :lat7, :lng7


	serialize :coordinates

  before_save :log_coordinates

  def log_coordinates
    self.coordinates = [{lat: self.lat1.to_f, lng: self.lng1.to_f},{lat: self.lat2.to_f, lng: self.lng2.to_f},{lat: self.lat3.to_f, lng: self.lng3.to_f},{lat: self.lat4.to_f, lng: self.lng4.to_f},{lat: self.lat5.to_f, lng: self.lng5.to_f},{lat: self.lat6.to_f, lng: self.lng6.to_f},{lat: self.lat7.to_f, lng: self.lng7.to_f}]
  end



          def find_or_create
          end

          def raw(stringish)
            stringish.to_s.html_safe
          end

end
