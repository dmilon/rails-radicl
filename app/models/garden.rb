class Garden < ApplicationRecord
  has_many :users
  has_many :follows
  has_many :zones, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
