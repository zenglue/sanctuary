class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def current_user
    super || guest_user
  end

  def guest_user
    User.new(username: "guest")
  end
end
