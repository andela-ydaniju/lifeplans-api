require "rails_helper"

RSpec.describe "Logging in to an account", type: :request do
  let(:user) do
    create(:user)
  end

  it "logs user in with correct entries" do
    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json"
    }
    post "/auth/login", {
      username: user.username,
      password: user.password,
    }, headers

    get "/auth/logout"
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
  end
end
