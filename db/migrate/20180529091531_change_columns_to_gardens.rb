class ChangeColumnsToGardens < ActiveRecord::Migration[5.2]
  def change
    change_table :gardens do |t|
      t.remove :location
      t.string :address
      t.remove :lat
      t.remove :long
      t.float :latitude
      t.float :longitude
    end
  end
end
