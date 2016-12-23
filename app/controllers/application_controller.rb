class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  private

  def guest_user
    if session[:guest_user_id].nil?
      session[:guest_user_id] = create_guest_user.id
    else
      session[:guest_user_id]
    end
  end

  def create_guest_user
    User.create(username: "guest", role: 0)
  end
end
