class AddDescriptionToReminder < ActiveRecord::Migration[6.1]
  def change
    add_column :reminders, :description, :bigint
  end
end
