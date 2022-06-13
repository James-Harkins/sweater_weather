require "rails_helper"

describe OpenLibraryService do
  describe "class methods" do
    describe "#get_books_by_location" do
      it "returns data for all books in their database by search parameter location" do
        denver_books = OpenLibraryService.get_books_by_location("denver,co")

        expect(denver_books).to be_a Hash
        expect(denver_books[:numFound]).to eq(42475)
        expect(denver_books[:docs]).to be_an Array
        expect(denver_books[:docs][0]).to be_a Hash
        expect(denver_books[:docs][0][:key]).to eq("/works/OL8503198W")
        expect(denver_books[:docs][0][:type]).to eq("work")
        expect(denver_books[:docs][0][:title]).to eq("Denver, Co")
        expect(denver_books[:docs][0][:isbn]).to be_an Array
        expect(denver_books[:docs][0][:isbn].count).to eq(2)
        expect(denver_books[:docs][0][:publisher]).to be_an Array
        expect(denver_books[:docs][0][:publisher].count).to eq(1)
      end
    end
  end
end
