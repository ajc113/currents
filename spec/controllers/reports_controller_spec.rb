RSpec.describe(ReportsController) do
  login_user
  before do
    @location = create(:location)
    @report = create(:report, location_id: @location.id, user: User.last)
  end

  it("should get index") do
    get :index
    assert_response(:success)
    expect(assigns(:reports)).not_to be_nil
  end

  it("should get new") do
    get :new
    assert_response(:success)
  end

  it("should create report") do
    expect do
      post :create,
        params: {
        report: {
          :best_bait => @report.best_bait,
          :location_id => @location.id,
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
          :wind => @report.wind,
          :state_waters => @report.state
        }
      }
    end.to(change { Report.count })
    # assert_redirected_to(report_path(assigns(:report)))
  end

  it("should show report") do
    get :show, params: { id: (@report) }
    assert_response(:success)
  end

  it("should get edit") do
    get :edit, params: { :id => (@report) }
    assert_response(:success)
  end

  it("should update report") do
    report_params = {
      :location_id => @location.id,
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
    }
    patch :update, params: {
      :id => (@report),
      :report => report_params
    }
    @report.reload
    expect(@report.catch_total).to eq 4545
    # assert_redirected_to(report_path(assigns(report)))
  end
  it("should destroy report") do
    expect { delete(:destroy, params: { id: @report }) }.to(change { Report.count }.by(-1))
    assert_redirected_to(reports_path)
  end
end
