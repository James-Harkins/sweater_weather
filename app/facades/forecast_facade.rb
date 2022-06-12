class ForecastFacade
  def self.generate_forecast(coordinates)
    data = OpenweatherService.get_forecast_data(coordinates)
    Forecast.new(data)
  end
end
