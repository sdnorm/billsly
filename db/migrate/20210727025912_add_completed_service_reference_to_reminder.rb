class AddCompletedServiceReferenceToReminder < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :reminders, :completed_service, index: {algorithm: :concurrently}
  end
end
