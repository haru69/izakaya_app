class MainController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def index

    uri = URI.parse URI.encode('http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=a53d2b44f8d80d6d&address=#{@address}&range=#{@range}&non_smoking=#{@smoking}&format=json')
    
    response = JSON.load(Net::HTTP.get(uri))
      response["rest"]
    
    @response =  response["rest"]
  end

def update
  @lat = params[:lat]
  @lng = params[:lng]
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
  end

 
  
end
