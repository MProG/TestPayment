class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    create_charge
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def create_charge
    customer = StripeTool.create_customer(email: params[:stripeEmail], stripe_token: params[:stripeToken])
    StripeTool.create_charge(customer_id: customer.id, amount: product.price, description: "Stripe customer")
  end

  def product
    @product ||= Product.find_by(id: params[:product_id], state: :active)
  end
end
