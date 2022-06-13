class BooksAndForecastSerializer
  def self.serialize_books_and_forecast_by_location(location, quantity)
    coordinates = MapquestFacade.get_latitude_and_longitude(location)
    forecast = ForecastFacade.generate_forecast(coordinates)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: forecast.current_weather[:conditions],
            temperature: "#{forecast.current_weather[:temperature].round} F"
          },
          total_books_found: BooksFacade.get_total_search_results_by_location(location),
          books: BooksFacade.get_quantity_of_books_by_location(location, quantity.to_i).map do |book|
            {
              isbn: book.isbn,
              title: book.title,
              publisher: book.publisher
            }
          end
        }
      }
    }
  end
end
