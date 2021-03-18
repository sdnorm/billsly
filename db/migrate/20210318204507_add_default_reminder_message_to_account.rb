class AddDefaultReminderMessageToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :default_reminder_message, :text
  end
end
