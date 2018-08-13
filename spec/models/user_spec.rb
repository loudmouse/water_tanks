require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:photos) }
  it { should have_many(:tank_locations) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:user_name) }
end
