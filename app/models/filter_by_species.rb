class FilterBySpecies
	def initialize(species)
		@species = species
	end

  def test_data
		@lreports = []
    Location.all.each do |location|
    end
  end

	def maps_data
		@lreports = []
		Location.all.each do |location|
      reports = location.reports.where(species)
      avgrep = reports.where(:date => 1.week.ago..Date.today).order(date: :desc)
      prevavgrep = reports.where(:date => 8.days.ago..1.day.ago)
      movavg = movingavg(avgrep,prevavgrep)
      @lreports.push(location:location,reports: userreport(avgrep),cfile: one_locations_json(location),movingavg: movavg[:movingavg], color: movavg[:color])
			end
    return @lreports
	end
  def species
    return nil if @species = "Any"
    return "species_id = @species"
  end
	def movingavg(avgrep,prevavgrep)
		movingavg = 0
		prevmovingavg = 0
		movingavg = avg(avgrep,1.week.ago.to_date,Date.today-1) unless avgrep.blank?
		prevmovingavg = avg(prevavgrep,1.week.ago.to_date-1,Date.today-2) unless prevavgrep.blank?
		puts "----moving average",  movingavg
		puts "----previous moving average",  prevmovingavg
		std_dev = movingavg - prevmovingavg
		if std_dev > 1
			color = "#FF3E38"
		elsif std_dev > 0
			color = "#C1AF6A"
		else
			color = "#4562A8"

		end
		@movingavg = {movingavg: movingavg,color: color }
		@movingavg
	end
	def avg(avgrep,startdate,enddate)
		avggroup = avgrep.group('date').average('catch_keepers')
		puts "Average function: "
		avarray = (startdate..enddate).map {|date|
			if avggroup[date]
				avggroup[date].to_f
			else
				0.to_f
			end
		}
		movingavg = avarray.inject{ |sum, el| sum + el }.to_f / avarray.size
	end
	def userreport(reports)
		@rep = []
		i = 0
		reports.each do |rep|
			puts "@rep user", rep.user.inspect
			puts "@rep user", rep.user.try(:vessel_name)
			puts "@rep user3"
			@rep.push({rep: rep, vessel_name: rep.user.try(:vessel_name)})
		end
		@rep
	end
	def one_locations_json(location)
		puts "Entered Locations JSON"
		f = File.read location.coordinate_file.path
		puts "Entered Locations JSON 2"
		puts "f ", eval(f).to_a
		eval(f).to_a
	end
end
