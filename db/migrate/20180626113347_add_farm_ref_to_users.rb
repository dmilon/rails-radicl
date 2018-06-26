class AddFarmRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :farm, foreign_key: true
  end
end
