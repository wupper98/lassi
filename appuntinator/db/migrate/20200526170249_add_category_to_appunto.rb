class AddCategoryToAppunto < ActiveRecord::Migration[5.1]
  def change
    add_column :appuntos, :category, :string
  end
end
