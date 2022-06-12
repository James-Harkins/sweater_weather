class BackgroundImageFacade
  def self.generate_background_image(location)
    background_image_data = UnsplashService.get_background_image_data(location)
    BackgroundImage.new(background_image_data)
  end
end
