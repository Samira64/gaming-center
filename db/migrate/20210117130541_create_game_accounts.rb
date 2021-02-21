class CreateGameAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :game_accounts do |t|
      t.string :title

      t.timestamps
    end
  end
end
