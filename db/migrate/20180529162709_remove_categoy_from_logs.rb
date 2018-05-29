class RemoveCategoyFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :categoy
  end
end
