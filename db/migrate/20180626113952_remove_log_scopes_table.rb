class RemoveLogScopesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :log_scopes
  end
end
