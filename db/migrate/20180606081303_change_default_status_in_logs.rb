class ChangeDefaultStatusInLogs < ActiveRecord::Migration[5.2]
  def change
    change_column :logs, :status, :boolean, default: false
  end
end
