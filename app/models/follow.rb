class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :garden
  validates :garden, uniqueness: { scope: :user }
end
