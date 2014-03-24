class Customer
  def self.create(user, token)
    Stripe::Customer.create(
      card: token,
      description: user.email
    )
  end
end