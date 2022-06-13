class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:quantity].to_i > 0
      render json: BooksAndForecastSerializer.serialize_by_location(params[:location], params[:quantity])
    else
      render json: {error: "Quantity must be greater than zero."}, status: 400
    end
  end
end
