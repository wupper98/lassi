class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer 'rating', null: false
      t.text 'body', default: "", null: false
      t.references 'user'
      t.references 'appunto'
    end
  end
end
