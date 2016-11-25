class MapsController < ApplicationController
  before_action :authenticate_user!
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
  @lreports = []
  Location.all.each do |location|
   if  params[:target_species] != "Any"
   #The following line used 'select' which converted reports to Array
    # .where can not be appliec on arrays so the code was throwing errors when not selected Any

    # reports =  location.reports.select{|l| l.target_species === params[:target_species]}

    #The following line has been changed to fix the error. Please confirm the output
    reports = location.reports.where(target_species: params[:target_species])

    avgrep = reports.where('date >= ?', 1.week.ago)
    movavg = movingavg(avgrep)
    puts "---movingavg", movavg
   @lreports.push(location:location,reports: userreport(reports),cfile: one_locations_json(location),movingavg: movavg[:movingavg], color: movavg[:color]) 
  else
    avgrep = location.reports.where('date >= ?', 1.week.ago)
    movavg = movingavg(avgrep)
    puts "---movingavg", movavg
    @lreports.push(location:location,reports: userreport(location.reports),cfile: one_locations_json(location),movingavg: movavg[:movingavg], color: movavg[:color])
  end
  end    
  render json: @lreports
end
  
def movingavg(avgrep)
  avggroup = avgrep.group('date').average('catch_keepers')
    avarray = avggroup.map{|a,b| b.to_f}
    movingavg = avarray.inject{ |sum, el| sum + el }.to_f / avarray.size
    puts "----moving average",  movingavg 
     n = avarray.size 
    sum_sqr = avarray.map {|x| x * x}.reduce(&:+)
    sum_sqr = 0 if sum_sqr.to_f.nan? || sum_sqr.nil?
    movingavg = 0 if movingavg.to_f.nan?
    std_dev = Math.sqrt((sum_sqr - n * movingavg * movingavg)/(n-1))
    if std_dev > 1 
      color = "#FF3E38"
    elsif std_dev > 0
      color = "#C1AF6A"
    else
      color = "#4562A8"
    end
    @movingavg = {movingavg: movingavg,color: color }
    @movingavg
end

def userreport(reports)
  @rep = []
  i = 0
  reports.each do |rep|
    @rep.push({rep: rep, vessel_name: rep.user.try(:vessel_name)})
  end
  @rep
end
  
def one_locations_json(location)
  f = File.read location.coordinate_file.path

  # puts "f is #{f.inspect}".green
  # # f = f[0]
  # puts "f[0] is #{f}".blue
  # location_json = JSON.parse(f)
  # puts "location_json is #{location_json}".green
  # return location_json
  puts "f ", eval(f).to_a
  eval(f).to_a
end

end


private
  def report_params
    params.require(:report).permit(:date, :target_species, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
  end
  def location_params
    @location = Location.where(params[:short_name])
  end