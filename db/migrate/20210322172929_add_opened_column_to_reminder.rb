class AddOpenedColumnToReminder < ActiveRecord::Migration[6.1]
  def change
    add_column :reminders, :opened, :boolean, default: false
  end
end
