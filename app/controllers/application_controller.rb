class ApplicationController < ActionController::Base
  before_action :check_if_logged_in_user

  protect_from_forgery with: :exception
  include SessionsHelper

  private def check_if_logged_in_user
    redirect_to login_url unless logged_in?
  end
end
