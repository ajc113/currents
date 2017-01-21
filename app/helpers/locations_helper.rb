module LocationsHelper
	def one_locations_json(location)
		puts "Entered Locations JSON helper" 
		f = File.read location.coordinate_file.path
		# puts "f is #{f.inspect}".green
		# # f = f[0]
		# puts "f[0] is #{f}".blue
		# location_json = JSON.parse(f)
		# puts "location_json is #{location_json}".green
		# return location_json
		f
	end
end
