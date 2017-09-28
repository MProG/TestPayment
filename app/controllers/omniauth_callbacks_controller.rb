class OmniauthCallbacksController < ApplicationController
  def stripe_connect
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.valid?
      sign_in_and_redirect @user, event: :authentication
    else
      flash.now[:alert] = @user.errors.full_messages
      redirect_to root_path
    end
  end

  def failure
    flash.now[:alert] = params["error_description"]
    redirect_to root_path
  end
end
