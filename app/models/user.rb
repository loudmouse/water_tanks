class User < ApplicationRecord
  extend FriendlyId
  friendly_id :user_name, use: [:slugged, :history, :finders]
  def should_generate_new_friendly_id?
    user_name_changed? || super
  end
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
  validates_presence_of :user_name

end
