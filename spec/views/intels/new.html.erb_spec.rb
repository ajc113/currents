require 'rails_helper'

RSpec.describe "intels/new", type: :view do
  before(:each) do
    assign(:intel, Intel.new(
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new intel form" do
    render

    assert_select "form[action=?][method=?]", intels_path, "post" do

      assert_select "input#intel_title[name=?]", "intel[title]"

      assert_select "textarea#intel_body[name=?]", "intel[body]"
    end
  end
end
