class RazorPayOrder < ApplicationRecord
  def self.save_order(order)
    order_attributes = order.attributes
    create!(
      order_id: order_attributes['id'],
      entity: order_attributes['entity'],
      amount: order_attributes['amount'],
      amount_due: order_attributes['amount_due'],
      currency: order_attributes['currency'],
      receipt: order_attributes['receipt'],
      offer_id: order_attributes['offer_id'],
      status: order_attributes['status'],
      attempts: order_attributes['attempts'],
      notes: order_attributes['notes'],
      created_at: order_attributes['created_at']
    )
  end
end
