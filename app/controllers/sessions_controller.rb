class SessionsController < ApplicationController
  skip_before_action :check_if_logged_in_user

  def new
  end

  def create
    login_id = params[:session][:login_id]
    password = params[:session][:password]

    user = User.new(login_id:, password:)
    user.valid?

    @error_messages = [blank_message(user, :login_id), blank_message(user, :password)].compact
    return render 'new' if @error_messages.present?

    login_user = User.find_by(login_id:)
    if login_user&.authenticate(password)
      log_in login_user
      redirect_to photos_path
    else
      @error_messages = ['ログインに失敗しました。再度入力してください']
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end

  private def blank_message(user, attr)
    user.errors.where(attr, :blank)[0]&.full_message
  end
end
