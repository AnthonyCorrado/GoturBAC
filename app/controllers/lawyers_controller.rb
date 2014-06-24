class LawyersController < ApplicationController

  include Yelp::V1::Review::Request
  response = HTTParty.get("http://api2.yp.com/listings/v1/details?listingid=13519&key=b1tj7csddx")

  puts response
  puts "hello"

  def index
    @lawyers = search("Los Angeles", "donuts")

  end

  def new
    @lawyers = Lawyer.new
  end

  def create
  end


  def search(location, search_term)
    # parameters = { term: params[:term], limit: 8 }
    @name = Yelp.client.search("los angeles", term: "cars",limit: 8).businesses[0].name
    @street = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].location.display_address[0]
    @city_state_zip = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].location.display_address[2]
    @phone = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].phone
    @web = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].url
   end

  def initialize
  end




end
