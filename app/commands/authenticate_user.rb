# frozen_string_literal: true

class AuthenticateUser
  prepend SimpleCommand

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    if user
      token = AuthToken.encode(user_id: user.id)
      user.update_attribute(:auth_token, token)

      {
        "token" => token
      }
    end
  end

  private

  attr_accessor :username, :password

  def user
    user = User.find_by(username: username)
    return user if user&.authenticate(password)

    errors.add :user_authentication, "invalid credentials"
    nil
  end
end
