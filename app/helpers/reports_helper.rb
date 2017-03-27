module ReportsHelper
	def selected_species(species)
		"selected" if params[:species].to_i == species
	end

	def selected_locations(location)
		"selected" if params[:location].to_i == location
	end

	def selected_tide(tide)
		"selected" if params[:tide] == tide
	end

	def all_species
		Report.all.collect(&:target_species).compact.uniq.reject(&:empty?)
	end
end
