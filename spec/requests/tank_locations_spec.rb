require 'rails_helper'

RSpec.describe "TankLocations", type: :request do
  describe "GET /" do
    it "successfully gets the index page" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
