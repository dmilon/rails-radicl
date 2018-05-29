class CreateLogScopes < ActiveRecord::Migration[5.2]
  def change
    create_table :log_scopes do |t|
      t.references :log, foreign_key: true
      t.references :element, foreign_key: true

      t.timestamps
    end
  end
end
