class CreateTestEmailReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :test_email_reminders do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
