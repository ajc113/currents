RSpec.describe "StaticPages" do
  let (:base_title) {" | Currents Network"}

  subject {page}

  describe "Home page" do
    before { visit root_path }
  end

  describe "About page" do
    before { visit about_path }
  end


  describe "Pricing page" do
    before { visit pricing_path }
    it { should have_content('Select Subscription Level') }
  end
end
