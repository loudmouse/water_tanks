class TankLocation < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :photos
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
