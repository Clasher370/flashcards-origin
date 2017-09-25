class ChangeLocaleDefaultForUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :locale, :string, null: true
  end
end
