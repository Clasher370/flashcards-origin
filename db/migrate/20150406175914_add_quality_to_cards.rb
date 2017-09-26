class AddQualityToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :quality, :integer, null: false, default: 5
  end
end
