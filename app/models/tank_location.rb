class TankLocation < ApplicationRecord
  validates :address, presence: true

  geocode_by :address

  has_many :comments, as: :commentable
  has_many :photos
  belongs_to :user
end
