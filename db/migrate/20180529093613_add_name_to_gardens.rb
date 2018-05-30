class AddNameToGardens < ActiveRecord::Migration[5.2]
  def change
    change_table :gardens do |t|
      t.string :name
    end
  end
end
