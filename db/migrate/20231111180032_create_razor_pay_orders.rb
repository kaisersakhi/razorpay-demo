class CreateRazorPayOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :razor_pay_orders do |t|
      t.string :order_id, index: true, null: false
      t.string :entity
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :amount_paid, precision: 10, scale: 2
      t.decimal :amount_due, precision: 10, scale: 2
      t.string :currency
      t.string :receipt
      t.string :offer_id
      t.string :status
      t.integer :attempts
      t.text :notes
      t.datetime :payment_at
      t.string :payment_id

      t.timestamps

    end
    add_index :razor_pay_orders, :receipt
  end
end
