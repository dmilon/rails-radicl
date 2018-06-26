class Zone < ApplicationRecord
  belongs_to :farm
  has_many :elements, dependent: :destroy
  has_many :actions, through: :elements

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
end
