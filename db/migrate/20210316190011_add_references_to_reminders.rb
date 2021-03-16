class AddReferencesToReminders < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :reminders, :account, null: false, index: {algorithm: :concurrently}
    add_reference :reminders, :client, null: false, index: {algorithm: :concurrently}
  end
end
