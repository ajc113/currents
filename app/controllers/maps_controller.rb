class MapsController < ApplicationController
	def index
	@reports = Report.all
    @hash = Gmaps4rails.build_markers(@reports) do |report, marker|
    marker.lat report.latitude
    marker.lng report.longitude
    marker.infowindow report.trip_summary
    @locations = Location.where(location_params)
	end

	 def new
	    @report = Report.new
	 end

	def show
	end
end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_report
	  @report = Report.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def report_params
	  params.require(:report).permit(:date, :target_species, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description)
	end

	  def location_params
      @location = Location.where(params[:short_name])
    end
end