require "rails_helper"

describe Book do
  describe "#initialize" do
    it "exists and has attributes" do
      book_data = {
        key: "/works/OL8503198W",
        type: "work",
        seed: ["/books/OL10909613M", "/works/OL8503198W", "/authors/OL2843451A"],
        title: "Denver, Co",
        title_suggest: "Denver, Co",
        has_fulltext: false,
        edition_count: 1,
        edition_key: ["OL10909613M"],
        publish_date: ["January 2001"],
        publish_year: [2001],
        first_publish_year: 2001,
        isbn: ["9780762507849", "0762507845"],
        last_modified_i: 1338943517,
        ebook_count_i: 0,
        publisher: ["Universal Map Enterprises"],
        language: ["eng"],
        author_key: ["OL2843451A"],
        author_name: ["Universal Map"],
        publisher_facet: ["Universal Map Enterprises"],
        _version_: 1715096877364412420,
        author_facet: ["OL2843451A Universal Map"]
      }

      book = Book.new(book_data)

      expect(book).to be_a Book
      expect(book.title).to eq("Denver, Co")
      expect(book.isbn).to be_an Array
      expect(book.isbn).to eq(["9780762507849", "0762507845"])
      expect(book.publisher).to be_an Array
      expect(book.publisher).to eq(["Universal Map Enterprises"])
    end
  end
end
