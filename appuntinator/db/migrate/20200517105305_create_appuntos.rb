class CreateAppuntos < ActiveRecord::Migration[5.1]
  def change
    create_table :appuntos do |t|
      t.text :contenuto
      t.string :rating
      t.datetime :release_date

      t.timestamps
    end
  end
end
