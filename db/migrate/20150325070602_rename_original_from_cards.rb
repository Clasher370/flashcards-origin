class RenameOriginalFromCards < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :original, :original_text
    rename_column :cards, :translated, :translated_text
    rename_column :cards, :review, :review_date
  end
end
