require 'rails_helper'

RSpec.describe TankLocationsController, type: :controller do

  describe "GET #new" do
    subject { get :new }

    context "When a user is not logged in" do

      it "does not return a successful response" do
        subject
        expect(response).not_to be_success
      end

      it "redirects to index" do
        expect(subject).to redirect_to(new_user_session_path)
      end

    end

  end
  
end
