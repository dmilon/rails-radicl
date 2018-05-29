class AddQuantityToElements < ActiveRecord::Migration[5.2]
  def change
    add_column :elements, :quantity, :integer
  end
end
