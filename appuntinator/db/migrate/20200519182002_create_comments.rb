class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer 'rating'
      t.text 'body'
      t.references 'user'
      t.references 'appunto'
    end
  end
end
