require 'rails_helper'


RSpec.describe SpotsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      spot = Spot.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      spot = Spot.create! valid_attributes
      get :show, {:id => spot.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      spot = Spot.create! valid_attributes
      get :edit, {:id => spot.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Spot" do
        expect {
          post :create, {:spot => valid_attributes}, valid_session
        }.to change(Spot, :count).by(1)
      end

      it "redirects to the created spot" do
        post :create, {:spot => valid_attributes}, valid_session
        expect(response).to redirect_to(Spot.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:spot => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested spot" do
        spot = Spot.create! valid_attributes
        put :update, {:id => spot.to_param, :spot => new_attributes}, valid_session
        spot.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the spot" do
        spot = Spot.create! valid_attributes
        put :update, {:id => spot.to_param, :spot => valid_attributes}, valid_session
        expect(response).to redirect_to(spot)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        spot = Spot.create! valid_attributes
        put :update, {:id => spot.to_param, :spot => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested spot" do
      spot = Spot.create! valid_attributes
      expect {
        delete :destroy, {:id => spot.to_param}, valid_session
      }.to change(Spot, :count).by(-1)
    end

    it "redirects to the spots list" do
      spot = Spot.create! valid_attributes
      delete :destroy, {:id => spot.to_param}, valid_session
      expect(response).to redirect_to(spots_url)
    end
  end

end
