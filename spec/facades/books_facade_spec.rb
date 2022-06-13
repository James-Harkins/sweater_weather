require "rails_helper"

describe BooksFacade do
  describe "class methods" do
    describe "#get_quantity_of_books_by_location" do
      it "returns a quantity of Book POROs by some location search param", :vcr do
        five_denver_books = BooksFacade.get_quantity_of_books_by_location("denver,co", 5)

        expect(five_denver_books).to be_all Book
        expect(five_denver_books.count).to eq(5)
        expect(five_denver_books[0].title).to eq("Denver, Co")
        expect(five_denver_books[0].isbn).to eq(["9780762507849", "0762507845"])
        expect(five_denver_books[0].publisher).to eq(["Universal Map Enterprises"])
      end
    end

    describe "#get_total_search_results_by_location" do
      it "returns the total number of OpenLibraryService.get_books_by_location search results", :vcr do
        results_total = BooksFacade.get_total_search_results_by_location("denver,co")

        expect(results_total).to eq(42475)
      end
    end

    describe "#get_books_data_by_location" do
      it "can cache OpenLibraryService calls with different location parameters", :vcr do
        location_1 = "denver,co"
        location_2 = "richmond,va"

        denver_books_data = BooksFacade.get_books_data_by_location(location_1)
        richmond_books_data = BooksFacade.get_books_data_by_location(location_2)

        expect(richmond_books_data).not_to eq(denver_books_data)
      end
    end
  end
end
