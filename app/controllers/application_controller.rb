class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :assign_env_variable

  def auth_user
    redirect_to user_stripe_connect_omniauth_authorize_path unless user_signed_in?
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource)
    root_path
  end

  def assign_env_variable
    gon.stripe_key = ENV["PUBLISHABLE_KEY"]
  end
end
