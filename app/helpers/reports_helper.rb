module ReportsHelper
	def selected_target_species(target_species)
		"selected" if @target_species == target_species
	end

	def selected_locations(loc)
		"selected" if @location == loc
	end

	def selected_tide(tide)
		"selected" if @tide == tide
	end

	def selected_date(date)
		"selected" if @date == date
	end	

end
