module ReportsHelper
	def selected_target_species(target_species)
		"selected" if @target_species == target_species.any?
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


	# do not belive this is referenced in code
	# def all_species
	# 	Report.all.collect(&:target_species).compact.uniq.reject(&:empty?)
	# end
end
