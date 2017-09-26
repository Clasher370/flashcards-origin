class ChangeLocaleNullForUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :locale, :string, null: false
  end
end
