class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.text :message
      t.references :account_client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
