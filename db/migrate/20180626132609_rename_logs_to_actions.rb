class RenameLogsToActions < ActiveRecord::Migration[5.2]
  def change
    rename_table :logs, :actions
  end
end
