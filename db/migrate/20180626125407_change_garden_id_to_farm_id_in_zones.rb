class ChangeGardenIdToFarmIdInZones < ActiveRecord::Migration[5.2]
  def change
    rename_column :zones, :garden_id, :farm_id
  end
end
