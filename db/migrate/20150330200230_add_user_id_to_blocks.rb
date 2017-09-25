class AddUserIdToBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :user_id, :integer, null: false
  end
end
