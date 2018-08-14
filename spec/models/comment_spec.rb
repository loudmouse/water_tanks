require 'rails_helper'

RSpec.describe Comment, type: :model do
   it { should belong_to(:commentable) }

   it "has a valid factory" do
     comment = FactoryBot.create(:comment)
     expect(comment).to be_valid
     expect(comment).to be_persisted
   end
end
