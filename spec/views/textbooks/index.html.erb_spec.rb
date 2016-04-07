require 'rails_helper'

RSpec.describe "textbooks/index", type: :view do
  before(:each) do
    assign(:textbooks, [
      Textbook.create!(
        :title => "Title",
        :department => "Department",
        :price => 1,
        :offer => false
      ),
      Textbook.create!(
        :title => "Title",
        :department => "Department",
        :price => 1,
        :offer => false
      )
    ])
  end

  it "renders a list of textbooks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Department".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
