class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather
  def initialize(attributes)
    @current_weather = generate_current_weather(attributes)
    @daily_weather = generate_daily_weather(attributes)
    @hourly_weather = generate_hourly_weather(attributes)
  end

  def generate_current_weather(attributes)
    {
      datetime: Time.at(attributes[:current][:dt]).to_datetime,
      sunrise: Time.at(attributes[:current][:sunrise]).to_datetime,
      sunset: Time.at(attributes[:current][:sunset]).to_datetime,
      temperature: attributes[:current][:temp],
      feels_like: attributes[:current][:feels_like],
      humidity: attributes[:current][:humidity],
      uvi: attributes[:current][:uvi],
      visibility: attributes[:current][:visibility],
      conditions: attributes[:current][:weather][0][:description],
      icon: attributes[:current][:weather][0][:icon]
    }
  end

  def generate_daily_weather(attributes)
    days = attributes[:daily][1..5]
    days.map do |day|
      {
        date: Time.at(day[:dt]).to_datetime,
        sunrise: Time.at(day[:sunrise]).to_datetime,
        sunset: Time.at(day[:sunset]).to_datetime,
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def generate_hourly_weather(attributes)
    hours = attributes[:hourly][0..7]
    hours.map do |hour|
      {
        time: Time.at(hour[:dt]).strftime("%H:%M"),
        temperature: hour[:temp],
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end
end
