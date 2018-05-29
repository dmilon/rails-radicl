class Log < ApplicationRecord
  belongs_to :user
  has_many :log_scopes
  has_many :elements, through: :log_scopes
end
