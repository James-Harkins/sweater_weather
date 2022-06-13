require "rails_helper"

describe "backgrounds request" do
  describe "GET background for some location" do
    it "returns a json response with details for some image for the requested location", :vcr do
      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/backgrounds", headers: headers, params: {location: "denver,co"}

      expect(response).to have_http_status(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      background = response_body[:data]

      data_keys = [:type, :id, :attributes]
      attributes_keys = [:image]
      image_keys = [:location, :image_url, :credit]
      credit_keys = [:source, :photographer_info]
      photographer_info_keys = [:name, :username, :link]

      expect(background.keys).to eq(data_keys)
      expect(background[:id]).to eq(nil)
      expect(background[:type]).to eq("image")

      expect(background[:attributes].keys).to eq(attributes_keys)
      expect(background[:attributes]).to have_key(:image)
      expect(background[:attributes][:image]).to be_a Hash

      expect(background[:attributes][:image].keys).to eq(image_keys)
      expect(background[:attributes][:image]).to have_key(:location)
      expect(background[:attributes][:image][:location]).to eq("denver,co")
      expect(background[:attributes][:image]).to have_key(:image_url)
      expect(background[:attributes][:image][:image_url]).to be_a String
      expect(background[:attributes][:image]).to have_key(:credit)
      expect(background[:attributes][:image][:credit]).to be_a Hash

      expect(background[:attributes][:image][:credit].keys).to eq(credit_keys)
      expect(background[:attributes][:image][:credit]).to have_key(:source)
      expect(background[:attributes][:image][:credit][:source]).to eq("Unsplash")
      expect(background[:attributes][:image][:credit]).to have_key(:photographer_info)
      expect(background[:attributes][:image][:credit][:photographer_info]).to be_a Hash

      expect(background[:attributes][:image][:credit][:photographer_info].keys).to eq(photographer_info_keys)
      expect(background[:attributes][:image][:credit][:photographer_info]).to have_key(:name)
      expect(background[:attributes][:image][:credit][:photographer_info][:name]).to be_a String
      expect(background[:attributes][:image][:credit][:photographer_info]).to have_key(:link)
      expect(background[:attributes][:image][:credit][:photographer_info][:link]).to be_a String
    end
  end
end
