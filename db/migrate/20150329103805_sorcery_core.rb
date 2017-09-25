class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :email, :string, null: false
    rename_column :users, :password, :crypted_password
    add_column :users, :salt, :string

    add_index :users, :email, unique: true
  end
end