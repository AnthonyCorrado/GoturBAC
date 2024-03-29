class Venue < ActiveRecord::Base

require 'foursquare2'
require 'pry'
require 'pry-nav'
require 'colorize'


client = Foursquare2::Client.new(:client_id => 'RKEGHDGKYNNB1KUHH5SKKWARFJLXIMQOVAUIMP5L5QIBHUC4', :client_secret => 'IQ0YBRKS05G203URBR51K3J5N0LAK5OOH3VAJDY1N5JB2TJS', :api_version => '20131016')

 def self.party(venue)

    auth = { query: { :client_id => 'RKEGHDGKYNNB1KUHH5SKKWARFJLXIMQOVAUIMP5L5QIBHUC4', :client_secret => 'IQ0YBRKS05G203URBR51K3J5N0LAK5OOH3VAJDY1N5JB2TJS', :api_version => '20131016', q: venue }}
    search_url = "https://api.foursquare.com/v2/venues/search"

    response = HTTParty.get search_url, auth

    response.parsed_response["venue"]
 end


# #API CALLS -------------------------------
# venues_data = client.search_venues(:ll => '34.012836, -118.495338', :query => 'gym')
# venues = venues_data.groups[0].items

# # this is sorting by _stats.checkinsCount
# venue_details = []

# venues.each do |v|
#   the_venue = client.venue(v.id)
#   venue_details << the_venue

#   #Adding all tips to our venues
#   v.the_tips = the_venue.tips.groups[0].items
# end
# #------------------------------------------------------------


# #MAGIC SEARCH ENGINE ----------------------------------------
# the_request = 'pool'

# results = []

# venues.each do |v|

#   v.the_tips.each do |tip|

#     if tip.text.match(/(.*)#{the_request}(.*)/)

#       the_result = Hashie::Mash.new
#       the_result.venue = v
#       the_result.tip = tip

#       results << the_result

#     end

#   end

# end


# # RESULTS OUTPUT -------------------------------------------



# # SORT THE RESULTS
# results.sort! do |b, a|
#   a.venue.stats.checkinsCount <=> b.venue.stats.checkinsCount
# end




# # ----------------------------------------------------------

# results.each do |r|

#   puts "#{r.venue.name} #{r.venue.stats.checkinsCount}".blue
#   puts "#{r.tip.text}".green

# end



 end
