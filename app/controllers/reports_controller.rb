class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /reports
  # GET /reports.json
  def index
  #   @filterrific = initialize_filterrific(
  #     Report,
  #     params[:filterrific],
  #     @filterrific.select_options = {
  #         with_target_species: Report.options_for_select,
  #         },
       
  #   ) or return
  #     @reports = @filterrific.find.page(params[:page])


  #   respond_to do |format|
  #     format.html
  #     format.js



      if current_user
      @reports = Report.where(user_id: [current_user.id])
     else
       redirect_to new_user_session_path, notice: 'You are not logged in.'
     end
     
end

def filter
  @target_species = params[:target_species] unless params[:target_species].blank?
  @location = Location.find(params[:location]) unless params[:location].blank?
  @tide = params[:tide] unless params[:tide].blank?
  puts "@location is #{@location.inspect}\n"
  puts "@target_species is #{@target_species}"
  puts "@tide is #{@tide.inspect}"

  @reports = current_user.reports
  @reports = @reports.selected_species(@target_species) if @target_species
  @reports = @reports.selected_location(@location) if @location
  @reports = @reports.selected_tide(@tide) if @tide

  # if @target_species && @location
  #   @reports = current_user.reports.where(target_species: @target_species, location: @location)
  # elsif @target_species
  #   @reports = current_user.reports.where(target_species: @target_species)
  # elsif @location
  #   @reports = current_user.reports.where(location: @location)
  # else
  #   @reports = current_user.reports 
  # end

  # @locations = @reports.collect(&:location).select{|location| location.short_name == @short_name} #you might need to add .flatten just before .select
  
  # @reports = @reports.select{|report| @locations.include?(report.location)}

  puts "@reports are #{@reports.inspect}"
  render 'index'
end

    # @reports = Report.all
    # @hash = Gmaps4rails.build_markers(@reports) do |report, marker|
    # marker.lat report.latitude
    # marker.lng report.longitude
    # marker.infowindow report.trip_summary
    # @locations = Location.where(location_params)

    # end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @reports = Report.all
  end

  # GET /reports/new
  def new
    @report = Report.new
   
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    @report.user=current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:date, :target_species, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
    end
    def location_params
      @location = Location.where(params[:short_name])
    end
end


