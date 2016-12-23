class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method:

  def home
  end

  def voting_cookie
    cookies.permanent[city_votes:[]]


end
