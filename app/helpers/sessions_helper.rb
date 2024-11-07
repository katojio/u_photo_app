module SessionsHelper
  LOGIN_ERROR_MESSAGES = {
    blank_user_id: 'ユーザーIDを入力してください',
    blank_password: 'パスワードを入力してください',
    wrong_login_info: 'ログインに失敗しました。再度入力してください'
  }.freeze

  def login_error_messages(keys)
    keys.map { LOGIN_ERROR_MESSAGES[_1] }
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
