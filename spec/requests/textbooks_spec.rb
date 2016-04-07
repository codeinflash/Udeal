require 'rails_helper'

RSpec.describe "Textbooks", type: :request do
  describe "GET /textbooks" do
    it "works! (now write some real specs)" do
      get textbooks_path
      expect(response).to have_http_status(200)
    end
  end
end
