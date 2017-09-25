class AddAttemptToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :attempt, :integer, null: false, default: 1
  end
end
