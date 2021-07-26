class AddReminderTypeToCompletedService < ActiveRecord::Migration[6.1]
  def change
    add_column :completed_services, :type_of_reminder, :bigint
  end
end
