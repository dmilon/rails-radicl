class ChangeLogs < ActiveRecord::Migration[5.2]
  def change
    change_column :logs, :description, :text
    add_reference :logs, :element
  end
end
