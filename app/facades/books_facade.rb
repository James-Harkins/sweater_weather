class BooksFacade
  def self.get_quantity_of_books_by_location(location, quantity)
    books_data = OpenLibraryService.get_books_by_location("denver,co")[:docs][0..(quantity - 1)]
    books_data.map { |book_data| Book.new(book_data) }
  end

  def self.get_total_search_results_by_location(location)
    OpenLibraryService.get_books_by_location(location)[:numFound]
  end

  def self.get_books_data_by_location(location)
    @cache ||= {}
    @cache[location.to_s] ||= OpenLibraryService.get_books_by_location(location)
  end
end
