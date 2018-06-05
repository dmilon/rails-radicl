class Log < ApplicationRecord
  belongs_to :user
  has_many :log_scopes, dependent: :destroy
  has_many :elements, through: :log_scopes
  ACTIONS = [
   "preparing soil",
   "fertilisating",
   "sowing",
   "transplanting",
   "watering",
   "weeding",
   "mulching",
   "caring crops",
   "carrying",
   "cleaning",
   "sharing",
   "others" ]
  validates :category, inclusion: { in: ACTIONS }

  def done?
    log.status
  end
end
