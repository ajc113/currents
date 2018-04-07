class MapsController < ApplicationController
  before_action :authorize_user!
  
  def index
  set_meta_tags title: "HeatMap",
            site: "Currents Fishing Network",
            reverse: true,
            description: "Fishing action heat map charting locations, species, and trending of where the bite is.  View by target speicies or location where you want to fish", 
            keywords: "New england fishing intel, boat ramps, catch reports, big game fishing, offshore fishing"
  end

  def create
  end

  def show
  end

  def filter_by_species
    render json: FilterBySpecies.new(current_user, params[:species], params[:state]).maps_data
  end

  def reports_of_location
    @reports= Report.location(params[:location_id]).past_one_week
    @reports= @reports.species(params[:species_id]) if params[:species_id].present? unless params[:species_id] == 'Any'
    render json: @reports.as_json(only: [:id, :date, :vessel_name, :primary_method, :catch_keepers, :trip_summary], :include => {:species => { only: :name }, :location => {only: :long_name}, :user => { only: [:id, :vessel_name] }})
  end

  def report_params
    params.require(:report).permit(:date, :species_id, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
  end
  def location_params
    @location = Location.find_by(short_name: params[:short_name])
  end
end
