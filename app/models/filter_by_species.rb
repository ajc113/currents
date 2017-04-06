class FilterBySpecies
	def initialize(species)
		@species = species
	end
	def maps_data
		@lreports = []
		Location.all.each do |location|
      reports = location.reports.where(species)
      avgrep = reports.where(:date => 1.week.ago..Date.today).order(date: :desc)
      moving_average = GetMovingAverage.new(reports).moving_average
      standart_deviation = GetMovingAverage.new(reports).standard_deviation
      @lreports.push(location:location,
                     reports: userreport(avgrep),
                     coordinate_file: one_locations_json(location),
                     moving_average: moving_average,
                     color: color(standart_deviation))
			end
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
	def one_locations_json(location)
		f = File.read location.coordinate_file.path
		eval(f).to_a
	end
end
