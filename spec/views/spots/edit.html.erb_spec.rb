require 'rails_helper'

RSpec.describe "spots/edit", type: :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!(
      :title => "MyString",
      :body => "MyText",
      :slug => "MyString"
    ))
  end

  it "renders the edit spot form" do
    render

    assert_select "form[action=?][method=?]", spot_path(@spot), "post" do

      assert_select "input#spot_title[name=?]", "spot[title]"

      assert_select "textarea#spot_body[name=?]", "spot[body]"

      assert_select "input#spot_slug[name=?]", "spot[slug]"
    end
  end
end
