class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.date :ship_date
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
