class Log < ApplicationRecord
  belongs_to :user
  has_many :log_scopes, dependent: :destroy
  has_many :elements, through: :log_scopes
  ACTIONS = [
   "preparing soil",
   "fertilisating soil",
   "sowing",
   "transplanting",
   "irrigating",
   "weeding",
   "mulching",
   "growing",
   "protecting and taking care of crops",
   "tying",
   "carrying",
   "cleaning",
   "harvesting",
   "washing and packing",
   "storing",
   "selling",
   "building",
   "others" ]
  validates :category, inclusion: { in: ACTIONS }
end
