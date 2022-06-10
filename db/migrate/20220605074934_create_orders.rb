class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.integer :value
      t.string :mobile
      t.text :address
      t.text :delivery_status, default:"Out for delivery"
      t.timestamps
    end
  end
end
