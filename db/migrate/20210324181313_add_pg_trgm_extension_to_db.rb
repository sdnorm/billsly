class AddPgTrgmExtensionToDb < ActiveRecord::Migration[6.1]
  def change
    # execute "create extension pg_trgm;"
    enable_extension :pg_trgm
  end
end
