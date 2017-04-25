class MapsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
  end

  def show
  end

  def filter_by_species
    render json: FilterBySpecies.new(current_user, params[:species], params[:state]).maps_data
  end

    def report_params
    params.require(:report).permit(:date, :species_id, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
  end
  def location_params
    @location = Location.where(params[:short_name])
  end
end
