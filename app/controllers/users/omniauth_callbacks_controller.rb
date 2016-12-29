class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication, notice: "Signed in with Google"
    else
      redirect_to root_path, error: "Google authentication failed"
    end
  end
end
