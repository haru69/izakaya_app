class MainController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def index

   # @lat = params[:lat]
    #@lng = params[:lng]
    #@range = params[:range]
    #@maney = params[:maney]
    #@smoking = params[:smoking]
    
    data = {
      "key": "a53d2b44f8d80d6d",
      "lat": 35.531328,
      "lng": 139.696899,
      "range": 1,
      #"budget": 1,
      "non_smoking": 0,
      "format": "json"
    }
  
    query = data.to_query
      uri = URI.parse('http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?' + query )
      res = Net::HTTP.get_response(uri)
      res_data = JSON.parse(res.body)
     @results = res_data
  end

def update

  require 'net/http'
  require 'uri'
  require 'json'

  @lat = results[0].geometry.location.lat()
  @lng = results[0].geometry.location.lng()
  @range = params[:range]
  @maney = params[:maney]
  @smoking = params[:smoking]
  
  data = {
    "key": ENV['API_KEY'],
    "lat": 35.531328,
    "lng": 139.696899,
    "range": 1,
    "budget": 1,
    "non_smoking": 1,
    "format": "json"
  }

  query = data.to_query
    uri = URI.parse('http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=a53d2b44f8d80d6d&lat=35.531328&lng=139.696899&range=2&non_smoking=1&format=json')
    res = Net::HTTP.get_response(uri)
   res_data = JSON.parse(res.body)
   @results = res_data

end

  def show
    @lat = 1
    @lng = 1
  end

 # 200 Success
def response_success(class_name, action_name)
  render status: 200, json: { status: 200, message: "Success #{class_name.capitalize} #{action_name.capitalize}" }
end

# 400 Bad Request
def response_bad_request
  render status: 400, json: { status: 400, message: 'Bad Request' }
end

# 401 Unauthorized
def response_unauthorized
  render status: 401, json: { status: 401, message: 'Unauthorized' }
end

# 404 Not Found
def response_not_found(class_name = 'page')
  render status: 404, json: { status: 404, message: "#{class_name.capitalize} Not Found" }
end

# 409 Conflict
def response_conflict(class_name)
  render status: 409, json: { status: 409, message: "#{class_name.capitalize} Conflict" }
end

# 500 Internal Server Error
def response_internal_server_error
  render status: 500, json: { status: 500, message: 'Internal Server Error' }
end
  
end
