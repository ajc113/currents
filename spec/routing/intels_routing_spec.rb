require "rails_helper"

RSpec.describe IntelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/intels").to route_to("intels#index")
    end

    it "routes to #new" do
      expect(:get => "/intels/new").to route_to("intels#new")
    end

    it "routes to #show" do
      expect(:get => "/intels/1").to route_to("intels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/intels/1/edit").to route_to("intels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/intels").to route_to("intels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/intels/1").to route_to("intels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/intels/1").to route_to("intels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/intels/1").to route_to("intels#destroy", :id => "1")
    end

  end
end
