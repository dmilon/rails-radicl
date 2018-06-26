class Farm < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :follows, dependent: :destroy
  has_many :zones, dependent: :destroy
  has_many :elements, through: :zones
  has_many :products, dependent: :destroy
  has_many :actions, through: :users, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
