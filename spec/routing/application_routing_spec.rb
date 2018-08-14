require "rails_helper"

RSpec.describe ApplicationController, type: :routing do
  describe "Basic application routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("tank_locations#index")
    end

    it "routes to user sign in" do
      expect(:get => "/users/sign_in").to route_to("devise/sessions#new")
    end

  end
end
