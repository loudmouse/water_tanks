class Photo < ApplicationRecord
  has_many :comments, as: commentable
  belongs_to :tank_location
  belongs_to :user 
end
