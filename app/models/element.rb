class Element < ApplicationRecord
  belongs_to :zone
  has_many :actions, dependent: :nullify

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
end
