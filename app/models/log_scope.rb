class LogScope < ApplicationRecord
  has_many :logs
  belongs_to :element
end
