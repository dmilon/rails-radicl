class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :location
      t.integer :area
      t.string :photo
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
