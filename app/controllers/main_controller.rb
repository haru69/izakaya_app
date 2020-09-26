class MainController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def index

    @lat = session[:lat]
    @lng = session[:lng]
  end

def update

 

  @lat = results[0].geometry.location.lat
  @lng = "1"
  @range = params[:range]
  @maney = params[:maney]
  @smoking = params[:smoking]
  
  data = {
    "key": ENV['API_KEY'],
    "lat": @lat,
    "lng": @lng,
    "range": @range,
    "budget": @maney,
    "non_smoking": @smoking,
    "format": "json"
  }

  query = data.to_query
    uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?" + query)
    res = Net::HTTP.get_response(uri)
    res_data = JSON.parse(res.body)
    results = res_data["results"]["shop"]

end

  def show
    @lat = 1
    @lng = 1
  end

 
  
end
