RSpec.describe "StaticPages" do
  let (:base_title) {" | Currents Network"}

  subject {page}

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Currents Fishing Network') }
    it { should have_title('Home' + base_title) }
  end

  describe "Blog page" do
    before { visit blog_path }
    it { should have_content('Weekly Fishing Reports') }
    it { should have_title('Weekly Forecast' + base_title) }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content('About Us') }
    it { should have_title('About Us' + base_title) }
  end

  describe "Rules page" do
    before { visit rules_path }
    it { should have_content('Network Rules') }
    it { should have_title('Network Rules') }
  end

  describe "Pricing page" do
    before { visit pricing_path }
    it { should have_content('Select Subscription Level') }
    it { should have_title('Pricing') }
  end
end
