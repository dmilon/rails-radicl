class Element < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :log_scopes, dependent: :destroy
  has_many :alert_scopes
  has_many :logs, through: :log_scopes
  belongs_to :zone

  mount_uploader :photo, PhotoUploader
end
