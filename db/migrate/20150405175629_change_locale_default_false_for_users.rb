class ChangeLocaleDefaultFalseForUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :locale, :string, default: nil
  end
end
