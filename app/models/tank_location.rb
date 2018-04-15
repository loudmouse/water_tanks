class TankLocation < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :photos
  belongs_to :user
end
