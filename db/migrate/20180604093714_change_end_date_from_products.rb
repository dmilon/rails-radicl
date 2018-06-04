class ChangeEndDateFromProducts < ActiveRecord::Migration[5.2]
  def change
    #change_column :products, :end_date, 'date USING CAST(end_date AS date)'
  end
end
