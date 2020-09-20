class MainController < ApplicationController
  def index
    require 'net/http'
    require 'uri'
    require 'json'
    uri = URI.parse('http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=a53d2b44f8d80d6d&address=#{@address}&range=#{@range}&non_smoking=#{@smoking}&format=json')
    
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    
    @address = 1
    @range = 1
    @budget = 'http://webservice.recruit.co.jp/hotpepper/budget/v1/?key=a53d2b44f8d80d6d&format=json'
    @smoking = 1 
  end

  def show
  end

 
  
end
