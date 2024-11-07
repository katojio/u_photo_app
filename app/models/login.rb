class Login
  def initialize(login_id:, password:)
    @login_id = login_id
    @password = password
    @errors = []
  end

  def errors
    @errors.push(:blank_user_id) if @login_id.blank?
    @errors.push(:blank_password) if @password.blank?
    return @errors if @errors.present?

    @errors.push(:wrong_login_info) unless user&.authenticate(@password)
    @errors
  end

  def user
    User.find_by(login_id: @login_id)
  end
end
