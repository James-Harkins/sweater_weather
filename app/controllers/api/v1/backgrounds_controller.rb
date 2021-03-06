class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundImageFacade.generate_background_image(params[:location])
    render json: BackgroundImageSerializer.serialize(image, params[:location])
  end
end
