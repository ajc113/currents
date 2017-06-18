class GetMovingAverage
  def initialize(reports)
    @reports ||= reports
  end

  def moving_average
    @movingavg = one_week_average(one_weeks_reports, Date.today-6).round(2)
  end

  def pre_moving_average
    @prevmovingavg = one_week_average(eight_days_reports, Date.today-7).round(2)
  end

  def one_weeks_reports
    @one_week_reports = @reports.past_week unless blank?
  end

  def eight_days_reports
    @eight_days_reports = @reports.between_times(Date.today-8, Date.today-1) unless blank?
  end

  def standard_deviation
    (moving_average - pre_moving_average).round(2)
  end

  def one_week_average(avgrep,startdate)
    enddate = startdate + 6
		avggroup = avgrep.group('date').average('catch_keepers')
		avarray = (startdate..enddate).map {|date|
			if avggroup[date]
				avggroup[date].to_f
			else
				0.to_f
			end
		}
		movingavg = avarray.reduce(:+).to_f / avarray.size
	end
end
