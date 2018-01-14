require 'rails_helper'

RSpec.describe "intels/show", type: :view do
  before(:each) do
    @intel = assign(:intel, Intel.create!(
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
