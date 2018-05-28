class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :categoy
      t.boolean :status
      t.date :date
      t.string :description
      t.references :user, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
