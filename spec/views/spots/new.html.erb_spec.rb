require 'rails_helper'

RSpec.describe "spots/new", type: :view do
  before(:each) do
    assign(:spot, Spot.new(
      :title => "MyString",
      :body => "MyText",
      :slug => "MyString"
    ))
  end

  it "renders new spot form" do
    render

    assert_select "form[action=?][method=?]", spots_path, "post" do

      assert_select "input#spot_title[name=?]", "spot[title]"

      assert_select "textarea#spot_body[name=?]", "spot[body]"

      assert_select "input#spot_slug[name=?]", "spot[slug]"
    end
  end
end
