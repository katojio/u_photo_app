class SessionsController < ApplicationController
  skip_before_action :check_if_logged_in_user
  before_action :set_user, only: [:new, :create]

  def new
  end

  def create
    login_id = user_params[:login_id]
    password = user_params[:password]

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

  private def set_user
    @user = User.new
  end

  private def user_params
    params.require(:user).permit(:login_id, :password)
  end

  private def blank_message(user, attr)
    user.errors.where(attr, :blank)[0]&.full_message
  end
end
