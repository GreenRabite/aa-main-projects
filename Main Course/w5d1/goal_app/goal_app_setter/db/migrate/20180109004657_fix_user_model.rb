class FixUserModel < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :session_token
    remove_column :users, :password_digest
    add_column :users, :password, :string
  end
end
