RSpec.describe GetMovingAverage do
  before do
    # Following is the hash of each day and catch_keepers
    # The new report will be created with each catch_keepers value
    report = {
     8 => [1,2,0,1],
     7 => [1,2,0,1],
     6 => [1,1,2,2],
     5 => [0],
     4 => [0],
     3 => [1,2,3,1],
     2 => [3,2,1,1,2],
     1 => [3,3,4,2,4],
     0 => [5,2,3,3,4]
    }
    report.each do |day, catch_keepers_array|
      catch_keepers_array.each do |catch_keepers|
        create(:report, catch_keepers: catch_keepers, date: Date.today - day)
      end
    end
  end

  it "should calculate moving average for the given reports" do
    class_instance = GetMovingAverage.new(Report.all)
    class_instance.moving_average
    expect(class_instance.moving_average).to eq(1.66)
    expect(class_instance.pre_moving_average).to eq(1.32)
    expect(class_instance.standard_deviation).to eq(0.34)
  end
end
