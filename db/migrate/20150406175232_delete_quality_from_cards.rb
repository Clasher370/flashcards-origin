class DeleteQualityFromCards < ActiveRecord::Migration[5.1]
  def change
    remove_column :cards, :quality
  end
end
