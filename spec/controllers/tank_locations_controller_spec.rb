require 'rails_helper'

RSpec.describe TankLocationsController, type: :controller do

  describe "GET #new" do
    it "does not return a successful response" do
      get :new
      expect(response).not_to be_success
    end
  end

end
