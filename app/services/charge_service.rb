class ChargeService
  def self.make_charge(current_user, product, stripe_token)
    create_stripe_customer(current_user, stripe_token) unless current_user.stripe_customer_id

    Stripe::Charge.create({
                            amount: product.price,
      currency: "usd",
      customer: current_user.stripe_customer_id,
      description: product.description,
      destination: product.user.uid,
      application_fee: (product.price / 10)
                          })
  end

  def self.create_stripe_customer(current_user, stripe_token)
    customer = Stripe::Customer.create(email: current_user.email, source: stripe_token)
    current_user.update(stripe_customer_id: customer.id)
  end
end
