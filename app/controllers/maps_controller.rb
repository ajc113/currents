class MapsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
  end

  def show
  end

  def filter_by_species

    @species = params[:species] unless params[:species].blank?
    @location = Location.find(params[:location]) unless params[:location].blank?
    @lreports = []
    Location.all.each do |location|
      if  params[:species] != "Any"
        #The following line used 'select' which converted reports to Array
        # .where can not be appliec on arrays so the code was throwing errors when not selected Any

        # reports =  location.reports.select{|l| l.target_species === params[:target_species]}

        #The following line has been changed to fix the error. Please confirm the output
        reports = location.reports.species(params[:species])
        puts "Report count = " + reports.count.to_s
        avgrep = reports.where(:date => 1.week.ago..Date.today).order(date: :desc)

        prevavgrep = reports.where(:date => 8.days.ago..1.day.ago)

        movavg = movingavg(avgrep,prevavgrep)
        puts "---movingavg", movavg
        @lreports.push(location:location,reports: userreport(avgrep),cfile: one_locations_json(location),movingavg: movavg[:movingavg], color: movavg[:color])
      else
        avgrep = location.reports.where('date >= ?', 1.week.ago.to_date).where('date < ?', Date.today).order(date: :desc)
        prevavgrep = location.reports.where('date >= ?', 1.week.ago.to_date - 1).where('date < ?', Date.today - 1)
        movavg = movingavg(avgrep,prevavgrep)
        puts "---movingavg", movavg
        @lreports.push( location:location,
                        reports: userreport(avgrep),
                        cfile: one_locations_json(location),
                        movingavg: movavg[:movingavg], 
                        color: movavg[:color]
                      )
        # @lreports.push(location:location,reports: userreport(reports),cfile: one_locations_json(location),movingavg: movavg[:movingavg], color: movavg[:color])

      end
    end
    render json: @lreports
  end
  def movingavg(avgrep,prevavgrep)
    movingavg = 0
    prevmovingavg = 0
    movingavg = avg(avgrep,1.week.ago.to_date,Date.today-1) unless avgrep.blank?
    prevmovingavg = avg(prevavgrep,1.week.ago.to_date-1,Date.today-2) unless prevavgrep.blank?
    puts "----moving average",  movingavg
    puts "----previous moving average",  prevmovingavg
    #  n = avarray.size
    # sum_sqr = avarray.map {|x| x * x}.reduce(&:+)
    # sum_sqr = 0 if sum_sqr.to_f.nan? || sum_sqr.nil?
    # movingavg = 0 if movingavg.to_f.nan?
    # std_dev = Math.sqrt((sum_sqr - n * movingavg * movingavg)/(n-1))
    std_dev = movingavg - prevmovingavg
    if std_dev > 1
      color = "#FF3E38"
    elsif std_dev > 0
      color = "#C1AF6A"
    else
      color = "#4562A8"
      # else std_dev < 0
      #   color = "#940CE8"

    end
    @movingavg = {movingavg: movingavg,color: color }
    @movingavg
  end
  def avg(avgrep,startdate,enddate)
    avggroup = avgrep.group('date').average('catch_keepers')
    puts "Average function: "
    avarray = (startdate..enddate).map {|date|
      if avggroup[date]
        avggroup[date].to_f
      else
        0.to_f
      end
    }
    movingavg = avarray.inject{ |sum, el| sum + el }.to_f / avarray.size
  end
  def userreport(reports)
    @rep = []
    i = 0
    reports.each do |rep|
      puts "@rep user", rep.user.inspect
      puts "@rep user", rep.user.try(:vessel_name)
      puts "@rep user3"
      @rep.push({rep: rep, vessel_name: rep.user.try(:vessel_name)})
    end
    @rep
  end
  def one_locations_json(location)
    puts "Entered Locations JSON"
    f = File.read location.coordinate_file.path
    puts "Entered Locations JSON 2"
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
  params.require(:report).permit(:date, :species_id, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description, :location_id)
end
def location_params
  @location = Location.where(params[:short_name])
end
