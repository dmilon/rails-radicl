class ChangeProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :element_id
    change_column :products, :description, :text
    add_reference :products, :farm
  end
end
