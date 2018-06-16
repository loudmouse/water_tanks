class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos
  has_many :tank_locations
  has_many :comments

  has_attached_file :profile_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "profile-photo-placeholder.png"
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/

  acts_as_voter
  validates :user_name, uniqueness: true

end
