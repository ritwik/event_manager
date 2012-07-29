class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :capacity
      t.boolean :discount

      t.timestamps
    end
  end
end
