class RemoveQuantityFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :quantity
  end
end
