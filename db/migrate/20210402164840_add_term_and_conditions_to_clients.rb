class AddTermAndConditionsToClients < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :terms_and_conditions, :boolean
  end
end
