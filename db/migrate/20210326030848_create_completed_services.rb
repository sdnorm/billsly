class CreateCompletedServices < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_services do |t|
      t.references :account
      t.references :client_profile
      t.references :provided_service

      t.timestamps
    end
  end
end
