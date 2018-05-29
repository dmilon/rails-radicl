class AddNameToElements < ActiveRecord::Migration[5.2]
  def change
    add_column :elements, :name, :string
  end
end
