class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.date :date
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
