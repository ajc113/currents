module LocationsHelper
	def one_locations_json(location)
		f = File.read location.coordinate_file.path
		f = f[0]
		location_json = JSON.parse(f)
		return location_json
	end
end
