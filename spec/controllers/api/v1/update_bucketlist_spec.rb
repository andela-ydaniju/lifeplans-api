require "rails_helper"
RSpec.describe "Update bucketlist process", type: :request do
  it "changes the attribute of a bucketlist" do
    bucketlist = create(:bucketlist)

    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json"
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
    bucketlist = create(:bucketlist)

    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json"
    }

    put "/bucketlists/#{bucketlist.id}", {
      title: nil,
    }, headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status :unprocessable_entity
  end
end
