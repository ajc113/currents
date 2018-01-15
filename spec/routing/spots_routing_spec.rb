require "rails_helper"

RSpec.describe SpotsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spots").to route_to("spots#index")
    end

    it "routes to #new" do
      expect(:get => "/spots/new").to route_to("spots#new")
    end

    it "routes to #show" do
      expect(:get => "/spots/1").to route_to("spots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spots/1/edit").to route_to("spots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spots").to route_to("spots#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spots/1").to route_to("spots#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spots/1").to route_to("spots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spots/1").to route_to("spots#destroy", :id => "1")
    end

  end
end
