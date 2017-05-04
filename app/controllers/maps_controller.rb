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

  def reports_of_location
    @reports= Report.where("location_id = #{params[:location_id]}")
    render json: @reports.as_json(only: [:id, :date, :vessel_name, :primary_method, :catch_total, :trip_summary, :user_id], :include => {:species => { only: :name }})
  end

  def report_params
    params.require(:report).permit(:date, :species_id, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
  end
  def location_params
    @location = Location.where(params[:short_name])
  end
end
