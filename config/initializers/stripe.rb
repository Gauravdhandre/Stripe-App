Rails.configuration.stripe = {
  :publishable_key => "pk_test_CG8bwuuV8ku4DESg0t7rhAXg",
  :secret_key      => "sk_test_9ooGTKzGAJN2KR82t0a4UgiH"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]