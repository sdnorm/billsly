class CreateProvidedServices < ActiveRecord::Migration[6.1]
  def change
    create_table :provided_services do |t|
      t.string :name
      t.text :description
      t.bigint :price
      t.bigint :price_in_cents
      t.references :account
      t.references :client_profile

      t.timestamps
    end
  end
end
