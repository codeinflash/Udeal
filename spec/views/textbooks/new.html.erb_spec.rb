require 'rails_helper'

RSpec.describe "textbooks/new", type: :view do
  before(:each) do
    assign(:textbook, Textbook.new(
      :title => "MyString",
      :department => "MyString",
      :price => 1,
      :offer => false
    ))
  end

  it "renders new textbook form" do
    render

    assert_select "form[action=?][method=?]", textbooks_path, "post" do

      assert_select "input#textbook_title[name=?]", "textbook[title]"

      assert_select "input#textbook_department[name=?]", "textbook[department]"

      assert_select "input#textbook_price[name=?]", "textbook[price]"

      assert_select "input#textbook_offer[name=?]", "textbook[offer]"
    end
  end
end
