class Image < ApplicationRecord
  belongs_to :tweet, optional: true
  mount_uploader :url, ImageUploader
end
