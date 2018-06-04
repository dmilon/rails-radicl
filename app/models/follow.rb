class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :garden, uniqueness: true
end
