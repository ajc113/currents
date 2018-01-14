require 'rails_helper'

RSpec.describe "Intels", type: :request do
  describe "GET /intels" do
    it "works! (now write some real specs)" do
      get intels_path
      expect(response).to have_http_status(200)
    end
  end
end
