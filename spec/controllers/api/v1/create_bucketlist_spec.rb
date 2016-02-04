require "rails_helper"

RSpec.describe "Bucketlist creation", type: :request do
  let(:user) do
    create(:user)
  end

  it "creates a new bucketlist item with correct params" do
    bucketlist = build(:bucketlist)

    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json"
    }
    post "/bucketlists", {
      title: bucketlist.title,
    }, headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
  end

  it "creates no bucketlist if title not given" do
    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json"
    }
    post "/bucketlists", {
      title: nil,
    }, headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(422)
  end
end
