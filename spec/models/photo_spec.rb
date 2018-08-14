require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should have_many(:comments) }
  it { should belong_to(:tank_location) }
  it { should belong_to(:user) }

  it "has a valid factory" do
    photo = FactoryBot.create(:photo)
    expect(photo).to be_valid
    expect(photo).to be_persisted
  end
end
