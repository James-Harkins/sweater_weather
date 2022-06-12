class BackgroundImage
  attr_reader :id, :image
  def initialize(attributes)
    @id = nil
    @image = generate_info_data(attributes)
  end

  def generate_info_data(attributes)
    {
      image_url: attributes[:urls][:full],
      credit: {
        source: "Unsplash",
        photographer_info: {
          name: attributes[:user][:name],
          username: attributes[:user][:username],
          link: attributes[:user][:links][:self]
        }
      }
    }
  end
end
