class Zone < ApplicationRecord
  belongs_to :garden
  has_many :elements, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
