class AddAccountReferenceToTestEmailReminder < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :test_email_reminders, :account, null: false, index: {algorithm: :concurrently}
  end
end
