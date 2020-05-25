class AddTrustLevelToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :trust_level, :integer, default: 0
  end
end
