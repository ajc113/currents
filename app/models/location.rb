class Location < ActiveRecord::Base
	has_many :reports


   serialize :coordinates
  
   attr_accessor :lat1, :lng1
   attr_accessor :lat2, :lng2
   attr_accessor :lat3, :lng3
   attr_accessor :lat4, :lng4
   attr_accessor :lat5, :lng5



	

  before_save :log_coordinates




  def log_coordinates
   a = []
  
   a.push ({lat: self.lat1.to_f, lng: self.lng1.to_f}) unless self.lat1.blank? || self.lng1.blank?
   a.push ({lat: self.lat2.to_f, lng: self.lng2.to_f}) unless self.lat2.blank? || self.lng2.blank?
   a.push ({lat: self.lat3.to_f, lng: self.lng3.to_f}) unless self.lat3.blank? || self.lng3.blank?
   a.push ({lat: self.lat4.to_f, lng: self.lng4.to_f}) unless self.lat4.blank? || self.lng4.blank?
     self.coordinates = a
  end


  def raw(stringish)
    stringish.to_s.html_safe
  end

end
