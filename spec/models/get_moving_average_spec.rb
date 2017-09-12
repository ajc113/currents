RSpec.describe GetMovingAverage do
  before do
    # Following is the hash of each day and catch_keepers
    # The new report will be created with each catch_keepers value
    # In excel sheet Day 4 has a record with catch_keeper value zero.
    # It has been removed from the test to demonstrate that if the records not
    # found than program considers it as zero
    report = {
     11 => [0.75],
     10 => [0.8],
     9  => [0.9],
     8  => [1],
     7  => [1,2,0,1],
     6  => [1,1,2,2],
     5  => [0],
     3  => [1,2,3,1],
     2  => [3,2,1,1,2],
     1  => [3,3,4,2,4],
     0  => [5,2,3,3,4]
    }
    report.each do |day, catch_keepers_array|
      catch_keepers_array.each do |catch_keepers|
        FactoryGirl.create(:report, catch_keepers: catch_keepers, date: Date.today - day)
      end
    end
    @reports = Report.all
    @maps_data = GetMovingAverage.new(@reports) 
  end

  it "should return reports of one week including today" do
    first_report_date = @maps_data.one_weeks_reports.first.date
    last_report_date = @maps_data.one_weeks_reports.last.date
    expect(first_report_date).to eq(Date.today)
    expect(last_report_date).to eq(Date.today-6)
  end

  it "should return reports of last eight days including today" do
    first_report_date = @maps_data.eight_days_reports.first.date
    last_report_date = @maps_data.eight_days_reports.last.date
    expect(first_report_date).to eq(Date.today-1)
    expect(last_report_date).to eq(Date.today-7)
  end

  it "should calculate moving average for the given reports" do
    expect(@maps_data.moving_average).to eq(1.66)
    expect(@maps_data.pre_moving_average).to eq(0.85)
    expect(@maps_data.standard_deviation).to eq(0.81)
  end

  it "should return zero if no reports are passed" do
    reports = Report.none 
    maps_data = GetMovingAverage.new(reports) 
    expect(maps_data.moving_average).to eq(0)
    expect(maps_data.standard_deviation).to eq(0)
  end
end
