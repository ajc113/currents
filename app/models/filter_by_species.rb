class FilterBySpecies
	def initialize(current_user, species = '', state)
		@species = "species_id = #{species}" unless species == ''
		@state = State.find(state)
		@locations = @state.locations
	end
	def maps_data
		@lreports = []
		@locations.all.each do |location|
			reports = location.reports.where(@species)
			avgrep = reports.past_one_week
      maps_data = GetMovingAverage.new(reports) unless reports.blank?
      moving_average = maps_data.try(:moving_average) || 0
      pre_moving_average = maps_data.try(:pre_moving_average) || 0
			standard_deviation = maps_data.try(:standard_deviation) || 0
			@lreports.push(location:location.as_json(only: [:id, :short_name, :long_name]),
				reports: avgrep.length,
				moving_average: moving_average,
        pre_moving_average: pre_moving_average,
        standard_deviation: standard_deviation,
				color: color(standard_deviation),
				coordinate_file: render_coordinate_file(location),
			)
		end
		@lreports.push(lat: @state.lat, lng: @state.lng)
		@lreports.push(zoom: @state.zoom)
		return @lreports
	end

	def color(standard_deviation)
    if standard_deviation > 0.5 then return "#FF3E38" end
    if standard_deviation > 0.1 then return "#C1AF6A" end
    if standard_deviation < 0.1 then return "#4562A8" end
	end

	def render_coordinate_file(location)
		begin
			eval(location.try(:coordinate_file).read).to_a
		rescue Exception => msg
			# PartyFoul::RacklessExceptionHandler.handle(msg, class: 'filter_by_species', method: 'render_coordinate_file')
			puts "File not found for #{location.short_name}"
			puts "Exception #{msg}"
		end
	end
end
