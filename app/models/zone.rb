class Zone < ApplicationRecord
  belongs_to :garden
  has_many :elements
end
