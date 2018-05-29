class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.integer :area
      t.string :photo
      t.references :zone, foreign_key: true

      t.timestamps
    end
  end
end
