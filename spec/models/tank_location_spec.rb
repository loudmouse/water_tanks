require 'rails_helper'

RSpec.describe TankLocation, type: :model do
  it { is_expected.to belong_to(:user) }
end
