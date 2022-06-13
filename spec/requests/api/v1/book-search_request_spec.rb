require "rails_helper"

describe "book-search request" do
  describe "GET books for some location and quantity" do
    it "returns a forecast for and collection of some quantity of books about some location" do
      get "/api/v1/book-search?location=denver,co&quantity=5"

      expect(response).to have_http_status(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      books = response_body[:data]

      expect(books[:id]).to eq(nil)
      expect(books[:type]).to eq("books")
      expect(books[:attributes][:destination]).to eq("denver,co")
      expect(books[:attributes][:forecast][:summary]).to be_a String
      expect(books[:attributes][:forecast][:temperature]).to be_a String
      expect(books[:attributes][:total_books_found]).to eq(42475)
      expect(books[:attributes][:books]).to be_an Array
      expect(books[:attributes][:books].count).to eq(5)

      books[:attributes][:books].each do |book|
        expect(book[:isbn]).to be_an Array
        book[:isbn].each do |isbn|
          expect(isbn).to be_a String
        end
        expect(book[:title]).to be_a String
        expect(book[:publisher]).to be_an Array
        book[:publisher].each do |publisher|
          expect(publisher).to be_a String
        end
      end
    end
  end
end
