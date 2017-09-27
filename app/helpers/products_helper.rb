module ProductsHelper
  def convert_cents(amount_in_cents)
    number_to_currency(amount_in_cents / 100)
  end
end
