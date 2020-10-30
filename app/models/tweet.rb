class Tweet < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :no_image
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy


  mount_uploader :video, VideoUploader

  def no_image(images_attributes)
    images_attributes[:url].blank?
  end

end
