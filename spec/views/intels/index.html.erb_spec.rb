require 'rails_helper'

RSpec.describe "intels/index", type: :view do
  before(:each) do
    assign(:intels, [
      Intel.create!(
        :title => "Title",
        :body => "MyText"
      ),
      Intel.create!(
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of intels" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
