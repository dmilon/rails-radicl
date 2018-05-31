class Zone < ApplicationRecord
  belongs_to :garden
  has_many :elements, dependent: :destroy
  has_many :logs, through: :elements
  validates :name, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader

end
