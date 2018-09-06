# https://github.com/thoughtbot/shoulda-matchers

require 'rails_helper'

RSpec.describe TankLocation, type: :model do
  it { is_expected.to belong_to(:user) }
  it { should have_many(:photos) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:photos) }
  it { should accept_nested_attributes_for(:photos) }
end
