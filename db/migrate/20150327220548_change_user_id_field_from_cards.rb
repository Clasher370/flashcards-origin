class ChangeUserIdFieldFromCards < ActiveRecord::Migration[5.1]
  def change
    change_column :cards, :user_id, :integer, null: false
  end
end
