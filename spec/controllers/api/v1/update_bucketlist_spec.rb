require "rails_helper"
RSpec.describe "Update bucketlist process", type: :request do
  let(:user) do
    create(:user)
  end
  it "changes the attribute of a bucketlist" do
    signin_helper(user.username, user.password)
    token = token_helper(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    put "/bucketlists/#{bucketlist.id}", {
      title: "Visit China",
    }, headers

    json = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status 200
    expect(json["title"]).to eql "Visit China"
  end

  it "alerts when nothing is changed" do
    signin_helper(user.username, user.password)
    token = token_helper(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    put "/bucketlists/#{bucketlist.id}", {
      title: nil,
    }, headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status :unprocessable_entity
  end
end