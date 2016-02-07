require "rails_helper"

RSpec.describe "Logging in to an account", type: :request do
  let(:user) do
    create(:user)
  end

  it "logs user in with correct entries" do
    signin_helper(user.username, user.password)

    token = token_helper(user.username, user.password)

    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    get "/auth/logout",
        {},
        headers

    expect(response).to have_http_status(200)
  end
end
