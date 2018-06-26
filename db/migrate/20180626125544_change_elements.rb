class ChangeElements < ActiveRecord::Migration[5.2]
  def change
    remove_column :elements, :quantity
    add_column :elements, :area, :integer
  end
end
