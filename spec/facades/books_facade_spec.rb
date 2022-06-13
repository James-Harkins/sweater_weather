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
  end
end
