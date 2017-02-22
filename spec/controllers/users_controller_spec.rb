require("spec_helper")
RSpec.describe UsersController do
  login_user
  # before { @user = users(:one) }
  it("should get index") do
    get(:index)
    assert_response(:success)
    expect(assigns(:users)).to_not(be_nil)
  end
  it("should get new") do
    get(:new)
    assert_response(:success)
  end
  it("should create user") do
    expect do
      post(:create, :user => ({ :boat_name => @user.boat_name, :email => @user.email, :home_port => @user.home_port }))
    end.to(change { User.count })
    assert_redirected_to(user_path(assigns(:user)))
  end
  it("should show user") do
    get(:show, :id => (@user))
    assert_response(:success)
  end
  it("should get edit") do
    get(:edit, :id => (@user))
    assert_response(:success)
  end
  it("should update user") do
    patch(:update, :id => (@user), :user => ({ :boat_name => @user.boat_name, :email => @user.email, :home_port => @user.home_port }))
    assert_redirected_to(user_path(assigns(:user)))
  end
  it("should destroy user") do
    expect { delete(:destroy, :id => (@user)) }.to(change { User.count }.by(-1))
    assert_redirected_to(users_path)
  end
end
