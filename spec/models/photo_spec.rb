require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should have_many(:comments) }
  it { should belong_to(:tank_location) }
  it { should belong_to(:user) }
end
