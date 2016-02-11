require "rails_helper"

describe "Signup process", type: :request do
  context "when signing up" do
    it "fails with invalid inputs" do
      user = build(:user)
      post "/users/register",
           {
             username: user.username,
             password: user.password,
             password_confirmation: Faker::Name.last_name
           },
           { HTTP_ACCEPT: "application/vnd.lifeplans-api.v1+json" }
      expect(response.status).to eql 422
    end

    it "successful with valid inputs" do
      user = build(:user)
      post "/users/register",
           {
             username: user.username,
             password: user.password,
             password_confirmation: user.password
           },
           { HTTP_ACCEPT: "application/vnd.lifeplans-api.v1+json" }
      expect(response.status).to eql 201
    end
  end
end
