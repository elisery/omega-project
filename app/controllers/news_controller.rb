# require 'news-api'
require 'httparty'

# class Partay
#   include HTTParty
# end

class NewsController < ApplicationController
  # include HTTParty
  def parse_news_keywords
    news_sources = NewsSource.all 
    arr = []
    news_sources.each do |n|
      arr << n["source"]
    end
    str = arr.join(",")
    str.gsub(/\A"|"\z/,'')
  end

  def index
    
    query_string = parse_news_keywords
    # @response = Partay.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=f833280d666545268dacc98702bd6703')
    # https://newsapi.org/v2/top-headlines?sources=techcrunch,techradar,engadget&apiKey=f833280d666545268dacc98702bd6703
    @response = HTTParty.get("https://newsapi.org/v2/top-headlines?sources=#{query_string}&apiKey=f833280d666545268dacc98702bd6703")
    # render json: @response["articles"]
    @news_items = @response["articles"]
  end

  

end
