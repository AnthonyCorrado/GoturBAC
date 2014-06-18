class Venue < ActiveRecord::Base

  has_many :users

    geocoded_by :address # do |obj, results|
  #   if geo = results.first
  #     obj.latitude = geo.latitude
  #     obj.longitude = geo.longitude
  #     obj.city = geo.city
  #     obj.zip = geo.zip
  #     obj.street_address = geo.street_address
  #     obj.address = geo.address
  #   else
  #     obj.address = nil
  #   end
  # end

    before_validation :geocode #, if: ->(obj){ obj.address.present? and obj.address.changed? }

      def self.party(venue)

        venue ||= "general assembly"

          auth = { query: { apikey: 'CLIENT_ID', q: venue }}
          venue_url = "https://api.foursquare.com/v2/venues/search.json"

          response = HTTParty.get venue_url, auth

          response.parsed_response["venues"]
      end

end
