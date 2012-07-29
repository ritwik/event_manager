class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :dietary_req
      t.integer :table_id
      t.integer :payment_id
      t.integer :price_id

      t.timestamps
    end
  end
end
