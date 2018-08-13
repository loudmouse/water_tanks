require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:photos) }
  it { should have_many(:tank_locations) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:user_name) }

  it "has a valid factory" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
    expect(user).to be_persisted
  end
end
