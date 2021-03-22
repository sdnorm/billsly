class AddReadColumnToReminder < ActiveRecord::Migration[6.1]
  def change
    add_column :reminders, :read, :boolean
  end
end
