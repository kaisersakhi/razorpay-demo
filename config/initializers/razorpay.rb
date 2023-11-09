key_id = Rails.application.credentials.dig(:razorpay, :key_id)
key_secret = Rails.application.credentials.dig(:razorpay, :key_secret)

Razorpay.setup(key_id, key_secret)