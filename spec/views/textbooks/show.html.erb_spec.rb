require 'rails_helper'

RSpec.describe "textbooks/show", type: :view do
  before(:each) do
    @textbook = assign(:textbook, Textbook.create!(
      :title => "Title",
      :department => "Department",
      :price => 1,
      :offer => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Department/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
