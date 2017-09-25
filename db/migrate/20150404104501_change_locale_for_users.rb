class ChangeLocaleForUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :locale, :string, null: false, default: ''
  end
end
