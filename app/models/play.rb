class Play < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploader :photo, PhotoUploader
end
