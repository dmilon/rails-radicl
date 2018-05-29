class Log < ApplicationRecord
  belong_to :user
  has_many :log_scope
end
