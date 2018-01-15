require 'rails_helper'

RSpec.describe "spots/index", type: :view do
  before(:each) do
    assign(:spots, [
      Spot.create!(
        :title => "Title",
        :body => "MyText",
        :slug => "Slug"
      ),
      Spot.create!(
        :title => "Title",
        :body => "MyText",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of spots" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
