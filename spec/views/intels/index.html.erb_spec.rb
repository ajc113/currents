require 'rails_helper'

RSpec.describe "intels/index", type: :view do
  before(:each) do
    assign(:intels, Kaminari.paginate_array([
      Intel.create!(
        :title => "Title",
        :body => "MyText"
      ),
      Intel.create!(
        :title => "Title",
        :body => "MyText"
      )
    ]).page(1))
  end

  it "renders a list of intels" do
    render
    expect(rendered).to match /Title/
  end
end
