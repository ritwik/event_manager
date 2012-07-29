class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :price
      t.integer :paid
      t.string :email

      t.timestamps
    end
  end
end
