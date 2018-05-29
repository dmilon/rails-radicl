class RemoveAreaFromElements < ActiveRecord::Migration[5.2]
  def change
    remove_column :elements, :area
  end
end
