class RazorpayOrdersController < ApplicationController

  # before_action
  skip_forgery_protection

  def create
    resource_id = params[:resource_id]

    if resource_id.nil?
      render json: {"message" => "resource id can't be blank"}, :status => :unprocessable_entity
      return
    end

    order = RazorPayOrder.find_by(receipt: resource_id)
    # Razorpay::Order.create(amount: 999, currency: 'INR', receipt: "test-id")
    if order.nil?
      order = Razorpay::Order.create(
        amount: 999,
        currency: 'INR',
        receipt: resource_id
      )
      RazorPayOrder.save_order(order)
    end

    render json: {order: order, key_id: Rails.application.credentials.dig(:razorpay, :key_id)}, status: :created
  end

  def callback

  end
end
