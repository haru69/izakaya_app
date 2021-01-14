class MainController < ApplicationController

  require 'net/http'
  require 'uri'
  require 'json'

  def index


  end

def update
  session[:address] = params[:address]
  session[:range] = params[:range]
  session[:smoking] = params[:smoking]
  session[:key] = "a53d2b44f8d80d6d"
  #session[:lat] = params[:lat].to_f
 # session[:lng] = params[:lng].to_f
  #session[:range] = params[:range].to_i
  #session[:smoking] = params[:smoking].to_i
  session[:keyword] = "居酒屋"
  session[:format] = "json"
 
  redirect_to "/show"
end

  def show
  
    data = {
      "key": session[:key],
      "address": session[:address],
      #"lat": session[:lat],
      #"lng": session[:lng],
      "range": session[:range],
      "keyword": session[:keyword],
      "non_smoking": session[:smoking],
      "format": session[:format]
    }

    query = data.to_query
  uri = URI.parse('http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?' + query )
    res = Net::HTTP.get_response(uri)
   hash = JSON.parse(res.body,symbolize_names: true)

@results = hash[:results]

   
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
