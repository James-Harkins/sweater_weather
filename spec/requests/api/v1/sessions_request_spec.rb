require "rails_helper"

describe "sessions request" do
  describe "POST /api/v1/sessions" do
    it "creates a new session and returns user data for that session" do
      user = User.create!(email: "test@testing.com", password: "test123", password_confirmation: "test123")

      json_payload = {
        email: "test@testing.com",
        password: "test123"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: json_payload.to_json, as: :json

      expect(response).to have_http_status(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      session_user = response_body[:data]

      expect(session_user[:type]).to eq("users")
      expect(session_user).to have_key(:id)
      expect(session_user[:id]).to be_a String
      expect(session_user).to have_key(:attributes)
      expect(session_user[:attributes]).to be_a Hash
      expect(session_user[:attributes][:email]).to eq(json_payload[:email])
      expect(session_user[:attributes]).to have_key(:api_key)
      expect(session_user[:attributes][:api_key]).to be_a String

      data_keys = [:id, :type, :attributes]
      attributes_keys = [:email, :api_key]

      expect(session_user.keys).to eq(data_keys)
      expect(session_user[:attributes].keys).to eq(attributes_keys)
    end

    it "returns a 400 error if that user cannot be authenticated" do
      user = User.create!(email: "test@testing.com", password: "test123", password_confirmation: "test123")

      json_payload = {
        email: "test@testing.com",
        password: "bad_password"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: json_payload.to_json, as: :json

      expect(response).to have_http_status(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Invalid credentials.")
    end

    it "returns a 400 error with the same generic message if there is no user in the database with that email address" do
      json_payload = {
        email: "test@testing.com",
        password: "test123"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: json_payload.to_json, as: :json

      expect(response).to have_http_status(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Invalid credentials.")
    end
  end
end
