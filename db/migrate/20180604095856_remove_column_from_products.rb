class RemoveColumnFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :end_date
  end
end
