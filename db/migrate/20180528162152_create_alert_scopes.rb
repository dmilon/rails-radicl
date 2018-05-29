class CreateAlertScopes < ActiveRecord::Migration[5.2]
  def change
    create_table :alert_scopes do |t|
      t.references :alert, foreign_key: true
      t.references :element, foreign_key: true

      t.timestamps
    end
  end
end
