require "rails_helper"

RSpec.describe "list all bucketlists", type: :request do
  let(:user) do
    create(:user)
  end

  it "shows a list of all bucketlists" do
    signin_helper(user.username, user.password)

    create_list(:bucketlist, 3)

    token = token_helper(user.username, user.password)
    get "/bucketlists", {},
        { HTTP_AUTHORIZATION: "token #{token}" }

    json = JSON.parse(response.body)

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
    expect(json.length).to eq(3)
  end

  it "shows a nothing if list is empty" do
    get "/bucketlists"
    signin_helper(user.username, user.password)

    token = token_helper(user.username, user.password)
    get "/bucketlists", {},
        { HTTP_AUTHORIZATION: "token #{token}" }

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 404
  end
end
