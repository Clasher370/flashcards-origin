class AddCurrentBlockToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_block, :integer, null: true
  end
end
