class Api::V1::RoadTripController < ApplicationController
  def create
    request_params = JSON.parse(params["_json"], symbolize_names: true)
    if User.find_by(api_key: request_params[:api_key])
      road_trip_data = TravelGuideFacade.generate_road_trip_data(request_params[:origin], request_params[:destination])
      render json: RoadTripSerializer.serialize(road_trip_data), status: :created
    else
      render json: {error: "unauthorized"}, status: 401
    end
  end
end
