class AddCategoryToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :category, :string
  end
end
