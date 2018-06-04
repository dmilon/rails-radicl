class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :end_date, :date
  end
end
