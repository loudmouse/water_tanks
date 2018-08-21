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

    context "When the user is logged in" do
      before { login_with }

      it "returns a success response" do
        subject
        expect(response).to be_success
      end
    end
  end


  # context 'when logged in' do
  #   before { login_with(:user) }
  #   it "returns a successful response" do
  #     get :new
  #     expect(response).to be_success
  #   end
  # end


end
