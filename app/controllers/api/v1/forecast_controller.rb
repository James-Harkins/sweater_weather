class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = MapquestFacade.get_latitude_and_longitude(params[:location])
    forecast = ForecastFacade.generate_forecast(coordinates)
    render json: ForecastSerializer.new(forecast)
  end
end
