class TankLocation < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :photos
  belongs_to :user

  validates :photos, presence: :true

  accepts_nested_attributes_for :photos
# reject_if: proc { |attributes| attributes['title'].blank? }
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
