class RemoveGardenRefFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :garden_id
    end
  end
end
