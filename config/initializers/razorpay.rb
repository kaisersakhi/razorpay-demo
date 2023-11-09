key_id = Rails.application.credentials.dig(:razorpay, :key_id)
secret_key = Rails.application.credentails.dig(:razorpay, :secret_key)

Razorpay.setup(key_id, secret_key)