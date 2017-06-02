class FilterBySpecies
	def initialize(current_user, species, state)
		@species = species || "Any"
    @state = state
    @locations = Location.where(state_waters: @state)
	end
	def maps_data
		@lreports = []
		@locations.all.each do |location|
      reports = location.reports.where(species)
      avgrep = reports.where(:date => 1.week.ago..Date.today).order(date: :desc)
      maps_data = GetMovingAverage.new(reports)
      moving_average = maps_data.moving_average
      standart_deviation = maps_data.standard_deviation
      @lreports.push(location:location.as_json(only: [:id, :short_name, :long_name]),
                     reports: userreport(avgrep).length,
                     moving_average: moving_average,
                     color: color(standart_deviation),
                     coordinate_file: render_coordinate_file(location)
                    )
			end
    @lreports.push(lat: State.find(@state).lat, lng: State.find(@state).lng)
    @lreports.push(zoom: State.find(@state).zoom)
    return @lreports
	end

  def color standart_deviation
    if standart_deviation > 1
			color = "#FF3E38"
		elsif standart_deviation > 0
			color = "#C1AF6A"
		else
			color = "#4562A8"
		end
  end

  def species
    return nil if @species == "Any"
    return "species_id = #{@species}"
  end
	
	def userreport(reports)
		@rep = []
		i = 0
		reports.each do |rep|
			@rep.push({rep: rep, vessel_name: rep.user.try(:vessel_name)})
		end
		@rep
	end
	def render_coordinate_file(location)
    begin
      eval(location.try(:coordinate_file).read).to_a
    rescue Exception => msg
      #PartyFoul::RacklessExceptionHandler.handle(msg, class: 'filter_by_species', method: 'render_coordinate_file')
      puts "File not found for #{location.short_name}"
      puts "Exception #{msg}"
    end
	end
end
