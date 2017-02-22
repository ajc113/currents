require 'test_helper'

class BuzzsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    sign_in admin_users(:one)
    @buzz = buzzs(:one)
  end

  test "logged in should get index" do
    get :index
    assert_response :success
    # assert_not_nil assigns(:buzzs)
  end

  test "not authenticated should get redirect" do
    get :index
    assert_response :redirect
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buzz" do
    assert_difference('Buzz.count') do
      post :create, buzz: { post: @buzz.post }
    end

    assert_redirected_to buzz_path(assigns(:buzz))
  end

  test "should show buzz" do
    get :show, id: @buzz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buzz
    assert_response :success
  end

  test "should update buzz" do
    patch :update, id: @buzz, buzz: { post: @buzz.post }
    assert_redirected_to buzz_path(assigns(:buzz))
  end

  test "should destroy buzz" do
    assert_difference('Buzz.count', -1) do
      delete :destroy, id: @buzz
    end

    assert_redirected_to buzzs_path
  end
end
