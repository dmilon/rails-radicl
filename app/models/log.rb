class Log < ApplicationRecord
  belongs_to :user
  has_many :log_scopes, dependent: :destroy
  has_many :elements, through: :log_scopes
  ACTIONS = [
   "preparing soil",
   "fertilisating soil",
   "sowing",
   "transplanting",
   "watering",
   "weeding",
   "mulching",
   "protecting and taking care of crops",
   "carrying",
   "cleaning",
   "conditionning and selling",
   "others" ]
  validates :category, inclusion: { in: ACTIONS }

  def done?
    log.status
  end
end
