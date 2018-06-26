class DropAlertScopes < ActiveRecord::Migration[5.2]
  def change
    drop_table :alert_scopes, force: :cascade
  end
end
