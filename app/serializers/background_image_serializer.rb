class BackgroundImageSerializer
  def self.serialize(image, location)
    {
      data: {
        type: "image",
        id: nil,
        attributes: {
          image: {
            location: location,
            image_url: image.image_url,
            credit: image.credit
          }
        }
      }
    }
  end
end
