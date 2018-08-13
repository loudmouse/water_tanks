class Photo < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :tank_location, optional: false
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x75" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  acts_as_votable
end
