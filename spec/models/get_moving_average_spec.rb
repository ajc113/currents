RSpec.describe GetMovingAverage do
  before do
    create(:report, catch_keepers: 1, date: Date.today-8)
    create(:report, catch_keepers: 2, date: Date.today-8)
    create(:report, catch_keepers: 0, date: Date.today-8)
    create(:report, catch_keepers: 1, date: Date.today-8)

    create(:report, catch_keepers: 1, date: Date.today-7)
    create(:report, catch_keepers: 2, date: Date.today-7)
    create(:report, catch_keepers: 0, date: Date.today-7)
    create(:report, catch_keepers: 1, date: Date.today-7)
    
    create(:report, catch_keepers: 1, date: Date.today-6)
    create(:report, catch_keepers: 1, date: Date.today-6)
    create(:report, catch_keepers: 2, date: Date.today-6)
    create(:report, catch_keepers: 2, date: Date.today-6)

    create(:report, catch_keepers: 0, date: Date.today-5)

    create(:report, catch_keepers: 0, date: Date.today-4)

    create(:report, catch_keepers: 1, date: Date.today-3)
    create(:report, catch_keepers: 2, date: Date.today-3)
    create(:report, catch_keepers: 3, date: Date.today-3)
    create(:report, catch_keepers: 1, date: Date.today-3)

    create(:report, catch_keepers: 3, date: Date.today-2)
    create(:report, catch_keepers: 2, date: Date.today-2)
    create(:report, catch_keepers: 1, date: Date.today-2)
    create(:report, catch_keepers: 1, date: Date.today-2)
    create(:report, catch_keepers: 2, date: Date.today-2)

    create(:report, catch_keepers: 3, date: Date.today-1)
    create(:report, catch_keepers: 3, date: Date.today-1)
    create(:report, catch_keepers: 4, date: Date.today-1)
    create(:report, catch_keepers: 2, date: Date.today-1)
    create(:report, catch_keepers: 4, date: Date.today-1)

    create(:report, catch_keepers: 5, date: Date.today)
    create(:report, catch_keepers: 2, date: Date.today)
    create(:report, catch_keepers: 3, date: Date.today)
    create(:report, catch_keepers: 3, date: Date.today)
    create(:report, catch_keepers: 4, date: Date.today)
  end

  it "should calculate moving average for the given reports" do
    class_instance = GetMovingAverage.new(Report.all)
    class_instance.moving_average
    expect(class_instance.moving_average).to eq(1.66)
    expect(class_instance.pre_moving_average).to eq(1.32)
    expect(class_instance.standard_deviation).to eq(0.34)
  end
end
