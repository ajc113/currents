require 'rails_helper'

RSpec.describe "intels/edit", type: :view do
  before(:each) do
    @intel = assign(:intel, create(:intel))
  end

  it "renders the edit intel form" do
    render

    assert_select "form[action=?][method=?]", intel_path(@intel), "post" do

      assert_select "input#intel_title[name=?]", "intel[title]"

      assert_select "textarea#intel_body[name=?]", "intel[body]"
    end
  end
end
