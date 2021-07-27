class AddReminderReferenceToTextMessage < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :text_messages, :reminder, index: {algorithm: :concurrently}
  end
end
