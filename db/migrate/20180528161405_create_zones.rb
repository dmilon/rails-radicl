class CreateZones < ActiveRecord::Migration[5.2]
  def change
    create_table :zones do |t|
      t.string :name
      t.integer :area
      t.string :photo
      t.references :garden, foreign_key: true

      t.timestamps
    end
  end
end
