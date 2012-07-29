class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :type
      t.integer :price

      t.timestamps
    end
  end
end
