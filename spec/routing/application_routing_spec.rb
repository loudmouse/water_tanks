#http://geekhmer.github.io/blog/2014/07/30/test-routes-with-rspec-in-ruby-on-rails/

require "rails_helper"

RSpec.describe ApplicationController, type: :routing do
  describe "Basic application routing" do

    it "routes / to tank_locations#index" do
        expect(get: "/").to route_to(
          controller: "tank_locations",
          action: "index"
        )
    end

    it "routes /users/sign_in to devise/sessions#new" do
        expect(get: "/users/sign_in").to route_to(
          controller: "devise/sessions",
          action: "new"
        )
    end

    it "routes /users/sign_up to registrations#new" do
        expect(get: "/users/sign_up").to route_to(
          controller: "registrations",
          action: "new"
        )
    end

    it "routes /users/edit to registrations#edit" do
        expect(get: "/users/edit").to route_to(
          controller: "registrations",
          action: "edit"
        )
    end

    it "routes /users/sign_out to devise/sessions#destroy" do
        expect(delete: "/users/sign_out").to route_to(
          controller: "devise/sessions",
          action: "destroy"
        )
    end

    it "routes /users/1 to users#show" do
        expect(get: "/users/1").to route_to(
          controller: "users",
          action: "show",
          id: "1"
        )
    end

    it "routes /users to users#index" do
        expect(get: "/users").to route_to(
          controller: "users",
          action: "index"
        )
    end

    it "routes /tank_locations to tank_locations#index" do
        expect(get: "/tank_locations").to route_to(
          controller: "tank_locations",
          action: "index"
        )
    end

    it "routes /tank_locations/1 to tank_locations#show" do
        expect(get: "/tank_locations/1").to route_to(
          controller: "tank_locations",
          action: "show",
          id: "1"
        )
    end

    it "routes /tank_locations/new to tank_locations#new" do
        expect(get: "/tank_locations/new").to route_to(
          controller: "tank_locations",
          action: "new"
        )
    end

    it "routes /tank_locations to tank_locations#create" do
        expect(post: "/tank_locations").to route_to(
          controller: "tank_locations",
          action: "create"
        )
    end

    it "routes /tank_locations/1/edit to tank_locations#edit" do
        expect(get: "/tank_locations/1/edit").to route_to(
          controller: "tank_locations",
          action: "edit",
          id: "1"
        )
    end

    it "routes /tank_locations/1 to tank_locations#update" do
        expect(put: "/tank_locations/1").to route_to(
          controller: "tank_locations",
          action: "update",
          id: "1"
        )
    end

    it "routes /tank_locations/1 to tank_locations#destroy" do
        expect(delete: "/tank_locations/1").to route_to(
          controller: "tank_locations",
          action: "destroy",
          id: "1"
        )
    end

    it "routes /404 to errors#not_found" do
        expect(get: "/404").to route_to(
          controller: "errors",
          action: "not_found"
        )
    end

    it "routes /422 to errors#unacceptable" do
        expect(get: "/422").to route_to(
          controller: "errors",
          action: "unacceptable"
        )
    end

    it "routes /500 to errors#internal_error" do
        expect(get: "/500").to route_to(
          controller: "errors",
          action: "internal_error"
        )
    end

  end
end
