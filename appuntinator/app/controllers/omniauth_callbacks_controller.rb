class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Google") if
      is_navigational_format?
    else
      session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url, :username => ""
    end
  end

  def failure
    redirect_to appunti_index_path
  end
end