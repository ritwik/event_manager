class RemoveTables < ActiveRecord::Migration
  def change
    drop_table :tables
    add_column :payments, :table_code, :string
  end
end
