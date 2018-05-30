class AddNameToGardens < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :name, :string
  end
end
