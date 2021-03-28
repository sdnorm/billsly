class AddLastReminderMessageToClientProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :client_profiles, :last_reminder_message, :text
  end
end
