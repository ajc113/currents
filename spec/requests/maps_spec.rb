require 'rails_helper'

RSpec.describe "/reports_of_location" do
  before do
    state=create(:state)
    @new_user = create(:user)
    login_as(@new_user, scope: :user)
    @location = create(:location)
    @report = create(:report, :location_id => @location.id, :state_waters => "MA")
  end

  it "returns particular fiedls of reports for a location" do
    get "/reports_of_location?location_id=1"
    
    expect(response).to have_http_status(:ok)
    expect(response.content_type).to eq('application/json')
  end

end 
