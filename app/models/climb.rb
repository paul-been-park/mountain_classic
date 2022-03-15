require "open-uri"
class Climb < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_base64_uploader :climb_photo, ClimbPhotoUploader

  # Direct associations

  has_many   :interactions,
             dependent: :destroy

  has_many   :comments,
             dependent: :destroy

  has_many   :first_ascents,
             dependent: :destroy

  belongs_to :mountain

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    route_name
  end
end
