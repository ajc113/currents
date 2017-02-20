require 'rails_helper'


RSpec.describe "StaticPages" do

  let (:base_title) {" | Currents Network"}

  describe "Home page" do

    it "should have the content 'Currents Fishing Network'" do
      visit '/'
      expect(page).to have_content('Currents Fishing Network')
    end

    it "should have the title" do
      visit '/'
      expect(page).to have_title('Home' + base_title)
    end
  end

  describe "Blog page" do
    it "should have the content 'Weekly Fishing Reports'" do
      visit '/blog'
      expect(page).to have_content('Weekly Fishing Reports')
    end

    it "should have the title" do
      visit '/blog'
      expect(page).to have_title('Weekly Forecast' + base_title)
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/about'
      expect(page). to have_title('About Us' + base_title)
    end
  end
end
