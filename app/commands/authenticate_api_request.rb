# frozen_string_literal: true
class AuthenticateApiRequest
  prepend SimpleCommand
  attr_reader :headers, :params

  def initialize(headers, params)
    @headers = headers
    @params = params
  end

  def call
    user
  end

  private

  def user
    token = get_token
    return if token_not_found? token

    user_by_token token
  end

  def get_token
    auth_header = headers["Authorization"]
    return token_by_header auth_header if auth_header

    params[:token]
  end

  def token_by_header(auth_header)
    auth_header.split(":").last.split("token").last.strip
  end

  def token_not_found?(token)
    if token.nil?
      errors[:message] = "A token is required."

      true
    end
  end

  def user_by_token(token)
    decoded_token = AuthToken.decode(token)
    if decoded_token
      match_id_to_user decoded_token["user_id"]
    else
      errors[:message] = "Token invalid."
    end
  end

  def match_id_to_user(user_id)
    user = User.find_by_id(user_id)
    errors[:message] = "Token invalid." unless user && user.auth_token

    user
  end
end
