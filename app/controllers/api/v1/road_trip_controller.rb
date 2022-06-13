class Api::V1::RoadTripController < ApplicationController
  def create
    request_params = JSON.parse(params["_json"], symbolize_names: true)
    if User.find_by(api_key: request_params[:api_key])
      render json: RoadTripSerializer.serialize(request_params[:origin], request_params[:destination]), status: :created
    end
  end
end
