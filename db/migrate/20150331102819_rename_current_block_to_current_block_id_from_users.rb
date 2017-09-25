class RenameCurrentBlockToCurrentBlockIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :current_block, :current_block_id
  end
end
