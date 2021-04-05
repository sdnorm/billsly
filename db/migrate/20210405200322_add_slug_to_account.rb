class AddSlugToAccount < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_column :accounts, :slug, :string
    add_index :accounts, :slug, unique: true, algorithm: :concurrently
  end
end
