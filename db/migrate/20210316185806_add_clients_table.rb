class AddClientsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :account_clients do |t|
      t.references :account
      t.references :client
      t.timestamps
    end
  end
end
