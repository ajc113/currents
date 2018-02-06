require 'rails_helper'

RSpec.describe "spots/index", type: :view do
  before(:each) do
    assign(:spots, Kaminari.paginate_array([
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
    ]).page(1))
  end

  it "renders a list of spots" do
    render
    expect(rendered).to match /Title/
    expect(rendered).to match /MyText/
  end
end
