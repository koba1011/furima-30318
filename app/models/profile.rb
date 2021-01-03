class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :icon_image
  has_one_attached :header_image
end
