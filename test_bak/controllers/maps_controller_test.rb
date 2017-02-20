require 'test_helper'

class MapsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get Maps page" do
  	get maps_url
  	assert_response :success
  	assert_select ":title", "Heat Map | Currents Network"
  end
end
