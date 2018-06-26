class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :products, :farms
    add_foreign_key :logs, :elements
  end
end
