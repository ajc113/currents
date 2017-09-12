class GetMovingAverage
  def initialize(reports)
    @reports ||= reports
  end

  def moving_average
    one_week_average(one_weeks_reports).round(2)
  end

  def pre_moving_average
    #one_week_average(eight_days_reports).round(2)
    one_week_average(one_week_prior_three_days_reports).round(2)
  end

  def one_weeks_reports
    @reports.past_one_week unless @reports.blank?
  end

  def eight_days_reports
    @reports.past_eight_days unless @reports.blank?
  end

  def one_week_prior_three_days_reports
    @reports.one_week_prior_three_days unless @reports.blank?
  end

  def standard_deviation
    (moving_average - pre_moving_average).round(2).to_f
  end

  def one_week_average(avgrep)
    group_average = avgrep.group('date').average('catch_keepers').map(&:last).flatten.reduce(:+) / 7 unless avgrep.blank?
    if group_average.blank?
      0
    else
      group_average
    end
	end
end
