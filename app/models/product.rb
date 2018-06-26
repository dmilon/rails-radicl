class Product < ApplicationRecord
  belongs_to :farm

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
end
