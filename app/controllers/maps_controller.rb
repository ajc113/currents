class MapsController < ApplicationController
	def index
	@reports = Report.all
    @locations = Location.all
	end

  def heatmap
    @reports = Report.all
    @locations = Location.all
  end

  def create
  end 

	def show
	end

  def filter_by_species

    @target_species = params[:target_species] unless params[:target_species].blank?
    @location = Location.find(params[:location]) unless params[:location].blank?
    

    puts "@target_species is #{@target_species}\n"
    puts "@location is #{@location.inspect}\n"


    @reports = current_user.reports
    @reports = @reports.selected_species(@target_species) if @target_species
    @reports = @reports.selected_location(@location) if @location
    puts "the reports are #{@reports.to_json}".blue
    
    # render json: @reports
  end


end


private
    def report_params
      params.require(:report).permit(:date, :target_species, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
    end
    def location_params
      @location = Location.where(params[:short_name])
    end

