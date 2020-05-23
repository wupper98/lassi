class AddCommCounterToAppuntos < ActiveRecord::Migration[5.1]
  def change
    add_column :appuntos, :comm_counter, :integer
  end
end
