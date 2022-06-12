require "rails_helper"

describe "users request" do
  describe "POST new user" do
    it "creates a new user in the database using the body of the request and generates an API key" do
      json_payload = {
        email: "test@testing.com",
        password: "test123",
        password_confirmation: "test123"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: json_payload.to_json, as: :json

      expect(response).to have_http_status(201)

      response_body = JSON.parse(response.body, symbolize_names: true)
      new_user = response_body[:data]

      expect(new_user[:type]).to eq("users")
      expect(new_user).to have_key(:id)
      expect(new_user[:id]).to be_a String
      expect(new_user).to have_key(:attributes)
      expect(new_user[:attributes]).to be_a Hash
      expect(new_user[:attributes][:email]).to eq(json_payload[:email])
      expect(new_user[:attributes]).to have_key(:api_key)
      expect(new_user[:attributes][:api_key]).to be_a String
    end

    it "sends back a 400 error for bad user params" do
      user = User.create!(email: "test@testing.com", password: "test123", password_confirmation: "test123")

      json_payload = {
        email: "test@testing.com",
        password: "test123",
        password_confirmation: "test123"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: json_payload.to_json, as: :json

      expect(response).to have_http_status(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      binding.pry

      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to be_a String
    end
  end
end
