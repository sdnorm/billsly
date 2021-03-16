class CreateClients < ActiveRecord::Migration[6.1]
  def change
    safety_assured { remove_reference :reminders, :account_client }
    drop_table :account_clients
    drop_table :client_profiles
    drop_table :clients

    create_table :clients do |t|
      t.timestamps
    end
  end
end
