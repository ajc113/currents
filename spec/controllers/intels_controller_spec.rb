require 'rails_helper'


RSpec.describe IntelsController, type: :controller do
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
      intel = Intel.create! valid_attributes
      get :index, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      intel = Intel.create! valid_attributes
      get :show, {:id => intel.to_param}, valid_session
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
      intel = Intel.create! valid_attributes
      get :edit, {:id => intel.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Intel" do
        expect {
          post :create, {:intel => valid_attributes}, valid_session
        }.to change(Intel, :count).by(1)
      end

      it "redirects to the created intel" do
        post :create, {:intel => valid_attributes}, valid_session
        expect(response).to redirect_to(Intel.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:intel => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested intel" do
        intel = Intel.create! valid_attributes
        put :update, {:id => intel.to_param, :intel => new_attributes}, valid_session
        intel.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the intel" do
        intel = Intel.create! valid_attributes
        put :update, {:id => intel.to_param, :intel => valid_attributes}, valid_session
        expect(response).to redirect_to(intel)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        intel = Intel.create! valid_attributes
        put :update, {:id => intel.to_param, :intel => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested intel" do
      intel = Intel.create! valid_attributes
      expect {
        delete :destroy, {:id => intel.to_param}, valid_session
      }.to change(Intel, :count).by(-1)
    end

    it "redirects to the intels list" do
      intel = Intel.create! valid_attributes
      delete :destroy, {:id => intel.to_param}, valid_session
      expect(response).to redirect_to(intels_url)
    end
  end

end
