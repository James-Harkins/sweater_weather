class BackgroundImage
  attr_reader :image_url, :credit
  def initialize(attributes)
    @image_url = attributes[:urls][:full]
    @credit = generate_credit_data(attributes)
  end

  def generate_credit_data(attributes)
    {
      source: "Unsplash",
      photographer_info: {
        name: attributes[:user][:name],
        username: attributes[:user][:username],
        link: attributes[:user][:links][:self]
      }
    }
  end
end
