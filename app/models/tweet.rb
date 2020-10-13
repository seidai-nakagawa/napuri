class Tweet < ApplicationRecord
  validates :text, presence: true, unless: :image? 

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy


  mount_uploader :image, ImageUploader

  mount_uploader :video, VideoUploader

end
