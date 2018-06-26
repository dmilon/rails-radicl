class RenameGardenIdToFarmIdInFollows < ActiveRecord::Migration[5.2]
  def change
    rename_column :follows, :garden_id, :farm_id
  end
end
