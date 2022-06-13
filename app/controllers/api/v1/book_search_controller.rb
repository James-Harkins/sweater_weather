class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:quantity].to_i > 0
      render json: BooksAndForecastSerializer.serialize_books_and_forecast_by_location(params[:location], params[:quantity])
    end
  end
end
