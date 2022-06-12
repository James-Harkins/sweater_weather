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
      expect(background).not_to have_key([:created_at])
      expect(background).not_to have_key([:updated_at])
      expect(background).not_to have_key([:promoted_at])
      expect(background).not_to have_key([:width])
      expect(background).not_to have_key([:height])
      expect(background).not_to have_key([:color])
      expect(background).not_to have_key([:blur_hash])
      expect(background).not_to have_key([:description])
      expect(background).not_to have_key([:alt_description])
      expect(background).not_to have_key([:urls])
      expect(background).not_to have_key([:links])
      expect(background).not_to have_key([:categories])
      expect(background).not_to have_key([:liked_by_user])
      expect(background).not_to have_key([:current_user_collections])
      expect(background).not_to have_key([:sponsorship])
      expect(background).not_to have_key([:topic_submissions])
      expect(background).not_to have_key([:links])
      expect(background).not_to have_key([:user])
      expect(background).not_to have_key([:tags])
    end
  end
end
