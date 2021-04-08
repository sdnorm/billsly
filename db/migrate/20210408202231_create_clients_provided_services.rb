class CreateClientsProvidedServices < ActiveRecord::Migration[6.1]
  def change
    create_table :clients_provided_services do |t|
      t.references :provided_service, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
