class OpenLibraryService
  def self.conn
    Faraday.new(url: "https://openlibrary.org") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.get_books_by_location(location)
    response = conn.get("/search.json") do |c|
      c.params[:q] = location
    end
    results = JSON.parse(response.body, symbolize_names: true)
  end
end
