class RenameGardensToFarms < ActiveRecord::Migration[5.2]
  def change
    rename_table :gardens, :farms
  end
end
