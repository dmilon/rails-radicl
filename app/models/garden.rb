class Garden < ApplicationRecord
  has_many :users
  has_many :follows
  has_many :zones

end
