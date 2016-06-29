class MapsController < ApplicationController
	def index
	@reports = Report.all
    @locations = Location.all
	end


	def show
	end
end



    def report_params
      params.require(:report).permit(:date, :target_species, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
    end
    def location_params
      @location = Location.where(params[:short_name])
    end

