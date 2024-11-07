class SessionsController < ApplicationController
  skip_before_action :check_if_logged_in_user

  def new
  end

  def create
    login = Login.new(login_id: params[:session][:login_id], password: params[:session][:password])

    @error_messages = login_error_messages(login.errors)
    return render 'new' if @error_messages.present?

    log_in login.user
    redirect_to photos_path
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
