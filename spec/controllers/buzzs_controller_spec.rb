RSpec.describe BuzzsController, :type => :controller do
  login_user
  before do
    @buzz = create(:buzz)
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end
  it "logged in should get index"  do
    visit buzzs_path
    assert_response(:success)
  end

  describe "GET #new" do
    before { visit new_buzz_path }
    it "should have content" do
      expect(response).to render_template(:new)
    end
  end

  it "should create buzz" do
    post :create, params: { buzz: {attribute: "value"} }
    expect(response).to render_template :new
  end

  it("should show buzz") do
    get :show, params: { id: @buzz }
    assert_response(:success)
  end

  it("should get edit") do
    get :edit, params: { id: @buzz }
    assert_response(:success)
  end

  it("should update buzz") do
    patch :update, params: { id: @buzz, buzz: { post: @buzz.post } }
    assert_redirected_to(buzz_path(assigns(:buzz)))
  end

  it("should destroy buzz") do
    expect { delete(:destroy, params: { id: @buzz }) }.to(change { Buzz.count }.by(-1))
    assert_redirected_to(buzzs_path)
  end
end
