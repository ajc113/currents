require 'rails_helper'

RSpec.describe "spots/show", type: :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!(
      :title => "Title",
      :body => "MyText",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render 'shared/spot_single', post: @spot
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
