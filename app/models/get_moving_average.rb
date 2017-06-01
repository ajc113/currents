class GetMovingAverage
  def initialize(reports)
    @reports ||= reports
  end

  def moving_average
    @movingavg = one_week_average(one_weeks_reports, Date.today-7)
    @prevmovingavg = one_week_average(eight_days_reports, Date.today-8)
  end

  def one_weeks_reports
    @reports.where(:date => Date.today-7..Date.today-1) unless blank?
  end

  def eight_days_reports
    @reports.where(:date => Date.today-8..Date.today-2) unless blank?
  end

  def standard_deviation
    @movingavg.to_i - @prevmovingavg.to_i
  end

  def one_week_average(avgrep,startdate)
    enddate = startdate + 7
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
