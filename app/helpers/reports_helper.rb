module ReportsHelper
	def selected_target_species(target_species)
		"selected" if @target_species == target_species
	end

	def selected_locations(locations)
		"selected" if @locations == locations
	end
end
