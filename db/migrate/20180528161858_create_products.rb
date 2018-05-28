class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :element, foreign_key: true
      t.integer :price
      t.string :description
      t.integer :quantity
      t.string :photo
      t.date :start_date
      t.integer :end_date

      t.timestamps
    end
  end
end
