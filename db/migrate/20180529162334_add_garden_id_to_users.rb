class AddGardenIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :garden, foreign_key: true
  end
end
