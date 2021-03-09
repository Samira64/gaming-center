class CreateGameAccountsSpreeOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :game_accounts_spree_orders do |t|
      t.references :game_account, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
    end
  end
end
