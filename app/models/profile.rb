class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  has_one_attached :header_image

  validates :text, presence: true
    
end
