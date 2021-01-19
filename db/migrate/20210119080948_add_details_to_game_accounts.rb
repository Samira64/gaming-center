class AddDetailsToGameAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :game_accounts, :username, :string
    add_column :game_accounts, :password, :string
    add_column :game_accounts, :email_id, :string
    add_column :game_accounts, :email_password, :string
    add_column :game_accounts, :platform, :string
    add_column :game_accounts, :status, :string
    add_column :game_accounts, :cap1_status, :string
    add_column :game_accounts, :cap2_status, :string
    add_column :game_accounts, :cap3_status, :string
    add_column :game_accounts, :remarks, :text
  end
end
