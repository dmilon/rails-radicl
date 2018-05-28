class AlertScope < ApplicationRecord
  belongs_to :alert
  belongs_to :element
end
