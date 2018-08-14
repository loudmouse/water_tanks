require "rails_helper"

RSpec.describe TankLocationsController, type: :routing do
  describe "Basic tank location routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("tank_locations#index")
    end

  end
end
