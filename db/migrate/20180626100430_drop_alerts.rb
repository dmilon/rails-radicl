class DropAlerts < ActiveRecord::Migration[5.2]
  def change
    drop_table :alerts, force: :cascade
  end
end
