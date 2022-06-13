class User < ApplicationRecord
  has_secure_password
  before_create :set_api_key

  validates_presence_of :email
  validates :email, uniqueness: true
  validates :api_key, uniqueness: true

  private

  def set_api_key
    if api_key.nil?
      self.api_key = SecureRandom.hex(10)
    end
  end
end
