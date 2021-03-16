class RemoveAccountFromCustomers < ActiveRecord::Migration[6.1]
  def change
    # safety_assured { remove_reference :customers, :account, null: false, foreign_key: true }
  end
end
