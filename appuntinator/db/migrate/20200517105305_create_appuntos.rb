class CreateAppuntos < ActiveRecord::Migration[5.1]
  def change
    create_table :appuntos, force: :cascade do |t|
      t.string :rating, default: 0
      t.text :contenuto, default: "", null: false
      t.integer "comm_counter", default: 0, null: false
      t.datetime :release_date
      t.references 'user'
      t.timestamps
    end
  end
end
