require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post :create, report: { best_bait: @report.best_bait, catch_keepers: @report.catch_keepers, catch_total: @report.catch_total, date: @report.date, general_location: @report.general_location, picture: @report.picture, primary_method: @report.primary_method, spot: @report.spot, target_species: @report.target_species, tide: @report.tide, trip_description: @report.trip_description, trip_summary: @report.trip_summary, weather: @report.weather, wind: @report.wind }
    end

    assert_redirected_to report_path(assigns(:report))
  end

  test "should show report" do
    get :show, id: @report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    patch :update, id: @report, report: { best_bait: @report.best_bait, catch_keepers: @report.catch_keepers, catch_total: @report.catch_total, date: @report.date, general_location: @report.general_location, picture: @report.picture, primary_method: @report.primary_method, spot: @report.spot, target_species: @report.target_species, tide: @report.tide, trip_description: @report.trip_description, trip_summary: @report.trip_summary, weather: @report.weather, wind: @report.wind }
    assert_redirected_to report_path(assigns(:report))
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end
end
