class AddRaffleIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :raffle, null: false, foreign_key: true
    remove_index :users, :email
    add_index :users, [:email, :raffle_id], unique: true
  end
end
