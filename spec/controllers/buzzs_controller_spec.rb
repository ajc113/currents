RSpec.describe BuzzsController, :type => :controller do
  login_user
  before do
    # user = FactoryGirl.create(:user)
    # @request.env["devise.mapping"] = Devise.mappings[:user]
    # login_as(user, :scope => :user)
    # sign_in(user)
    @buzz = create(:buzz)
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      puts response.body
      expect(response).to be_success
      expect(response).to render_template(:index)
      # expect(response).to have_http_status_code(200)
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
    post :create, buzz: {attribute: "value"}
    expect(response).to render_template :new
  end
  # it("not authenticated should get redirect") do
  #   sign_out :user
  #   visit buzzs_path
  #   puts response.location
  #   expect(response.body).to have_content("Sign In") 
  # end
  #   it("should get new") do
  #     get(:new)
  #     assert_response(:success)
  #   end
  #   it("should create buzz") do
  #     expect { post(:create, :buzz => ({ :post => @buzz.post })) }.to(change { Buzz.count })
  #     assert_redirected_to(buzz_path(assigns(:buzz)))
  #   end
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
