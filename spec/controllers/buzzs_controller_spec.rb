require("spec_helper")
RSpec.describe(BuzzsController) do
  include(Devise::TestHelpers)
  before do
    admin_user = FactoryGirl.create(:admin_user)
    admin_user.save
    # sign_in(admin_user)
    login_as(admin_user, :scope => :admin_user)
    @buzz = create(:buzz)
  end
  it("logged in should get index") do
    get(:index)
    assert_response(:success)
  end
  it("not authenticated should get redirect") do
    get(:index)
    assert_response(:redirect)
  end
  it("should get new") do
    get(:new)
    assert_response(:success)
  end
  it("should create buzz") do
    expect { post(:create, :buzz => ({ :post => @buzz.post })) }.to(change { Buzz.count })
    assert_redirected_to(buzz_path(assigns(:buzz)))
  end
  it("should show buzz") do
    get(:show, :id => (@buzz))
    assert_response(:success)
  end
  it("should get edit") do
    get(:edit, :id => (@buzz))
    assert_response(:success)
  end
  it("should update buzz") do
    patch(:update, :id => (@buzz), :buzz => ({ :post => @buzz.post }))
    assert_redirected_to(buzz_path(assigns(:buzz)))
  end
  it("should destroy buzz") do
    expect { delete(:destroy, :id => (@buzz)) }.to(change { Buzz.count }.by(-1))
    assert_redirected_to(buzzs_path)
  end
end
