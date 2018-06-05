class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :garden
  validates :garden_id, uniqueness: true
end
