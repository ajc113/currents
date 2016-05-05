class Location < ActiveRecord::Base
	

	serialize :coordinates


	SPOT_A = [
            {lat:  42.083668, lng: -70.634360}, 
            {lat: 42.053668, lng: -70.462698},
            {lat:  41.926516, lng:  -70.359015}, 
            {lat: 41.881544, lng:  -70.522497},
          ].to_json


          # def as_json
          # 	[
          # 		{lat: self.lat1, lng: self.long1},
          # 		{lat: self.lat2, lng: self.long2},
          # 		{lat: self.lat3, lng: self.long3},
          # 		{lat: self.lat4, lng: self.long4}
          # 	].to_json
          # end


          def find_or_create
          end
end
