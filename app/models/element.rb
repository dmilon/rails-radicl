class Element < ApplicationRecord
  has_many :products
  has_many :log_scopes
  has_many :alert_scopes
  belongs_to :zone
end
