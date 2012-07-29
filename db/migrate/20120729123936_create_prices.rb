class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
