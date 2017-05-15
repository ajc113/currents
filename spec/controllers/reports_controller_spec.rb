RSpec.describe(ReportsController) do
  login_user
  before do
    @report = create(:report)
    @state = create(:state)
  end

  it("should get index") do
    get(:index)
    assert_response(:success)
    expect(assigns(:reports)).to_not(be_nil)
  end
  it("should get new") do
    get(:new)
    assert_response(:success)
  end
  it("should create report") do
    expect do
      post(:create,
           :report => ({
                         :best_bait => @report.best_bait,
                         :location_id => @report.location_id,
                         :catch_keepers => @report.catch_keepers,
                         :catch_total => @report.catch_total,
                         :date => @report.date,
                         :primary_method => @report.primary_method,
                         :spot => @report.spot,
                         :species_id => @report.species_id,
                         :tide => @report.tide,
                         :trip_description => @report.trip_description,
                         :trip_summary => @report.trip_summary,
                         :weather => @report.weather,
                         :wind => @report.wind
      }))
    end.to(change { Report.count })
    # assert_redirected_to(report_path(assigns(:report)))
  end
  it("should show report") do
    get(:show, :id => (@report))
    assert_response(:success)
  end
  it("should get edit") do
    get(:edit, :id => (@report))
    assert_response(:success)
  end
  it("should update report") do
    patch(:update, :id => (@report),
          :report => ({
                        :best_bait => @report.best_bait,
                        :catch_keepers => @report.catch_keepers,
                        :catch_total => 4545,
                        :date => @report.date,
                        :primary_method => @report.primary_method,
                        :spot => @report.spot,
                        :species_id => @report.species_id,
                        :tide => @report.tide,
                        :trip_description => @report.trip_description,
                        :trip_summary => @report.trip_summary,
                        :weather => @report.weather,
                        :wind => @report.wind
    }))
    @report.reload
    expect(@report.catch_total).to eq 4545
    # assert_redirected_to(report_path(assigns(report)))
  end
  it("should destroy report") do
    expect { delete(:destroy, :id => (@report)) }.to(change { Report.count }.by(-1))
    assert_redirected_to(reports_path)
  end
end
