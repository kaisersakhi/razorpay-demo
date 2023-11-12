class WelcomeController < ApplicationController
  def checkout
    # @order = Razorpay::Order.create(amount: 999, currency: 'INR', receipt: "test-id")
    @resource_id = 1
  end
end
