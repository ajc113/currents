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
    @reports= Report.where(location_id: params[:location_id])
    @reports= @reports.where(species_id: params[:species_id]) if params[:species_id].present? unless params[:species_id] == 'Any'
    render json: @reports.as_json(only: [:id, :date, :vessel_name, :primary_method, :catch_keepers, :trip_summary], :include => {:species => { only: :name }, :location => {only: :long_name}, :user => { only: [:id, :vessel_name] }})
  end

  def report_params
    params.require(:report).permit(:date, :species_id, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
  end
  def location_params
    @location = Location.find_by(short_name: params[:short_name])
  end
end
