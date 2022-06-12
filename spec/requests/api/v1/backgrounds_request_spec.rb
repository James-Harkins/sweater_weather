require "rails_helper"

describe "backgrounds request" do
  describe "GET background for some location" do
    it "returns a json response with details for some image for the requested location" do
      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/backgrounds", headers: headers, params: {location: "denver,co"}

      response_body = JSON.parse(response.body, symbolize_names: true)
      background = response_body[:data]

      expect(background[:id]).to eq(nil)
      expect(background[:type]).to eq("background_image")
      expect(background[:attributes]).to have_key(:image)
      expect(background[:attributes][:image]).to be_a Hash
      expect(background[:attributes][:image]).to have_key(:location)
      expect(background[:attributes][:image][:location]).to be_a String
      expect(background[:attributes][:image]).to have_key(:image_url)
      expect(background[:attributes][:image][:image_url]).to be_a String
      expect(background[:attributes][:image]).to have_key(:credit)
      expect(background[:attributes][:image][:credit]).to be_a Hash
      expect(background[:attributes][:image][:credit]).to have_key(:source)
      expect(background[:attributes][:image][:credit][:source]).to eq("Unsplash")
      expect(background[:attributes][:image][:credit]).to have_key(:photographer_info)
      expect(background[:attributes][:image][:credit][:photographer_info]).to be_a Hash
      expect(background[:attributes][:image][:credit][:photographer_info]).to have_key(:name)
      expect(background[:attributes][:image][:credit][:photographer_info][:name]).to be_a String
      expect(background[:attributes][:image][:credit][:photographer_info]).to have_key(:link)
      expect(background[:attributes][:image][:credit][:photographer_info][:link]).to be_a String
    end
  end
end
