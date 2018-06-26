class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :farm

  validates :farm, uniqueness: { scope: :user }
end
