class CreateGameAccountsSpreeOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :game_accounts_spree_orders, id: false do |t|
      t.belongs_to :game_account
      t.belongs_to :order
    end
  end
end
