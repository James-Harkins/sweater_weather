class ForecastFacade
  def self.generate_forecast(coordinates)
    data = OpenweatherService.get_forecast_data(coordinates)
    Forecast.new(data)
  end

  def self.generate_forecast_by_travel_guide(travel_guide)
    destination_coordinates = travel_guide.destination_coordinates
    if destination_coordinates
      destination_forecast = generate_forecast(destination_coordinates)
      destination_forecast.weather_at_eta(travel_guide.travel_time)
    else
      {}
    end
  end
end
