class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :invalid_card
  before_action :auth_user

  def new; end

  def create
    ChargeService.make_charge(current_user, product, params[:stripeToken])
  end

  private

  def product
    @product ||= Product.find_by(id: params[:product_id], state: :active)
  end

  def invalid_card(exception)
    flash[:error] = exception.message
    redirect_to root_path
  end
end
