class AddImageToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :image, :string
  end
end
