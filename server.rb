require 'sinatra'
require 'json'
require 'curb'

class Cookie
  attr_accessor :name, :price, :description
  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end
end

chocolate_chip = Cookie.new("Chocolate Chip", "1.25", "Cookie with chocolate chips")


get '/' do
  erb :home
end

get '/cakes' do
  erb :cakes
end

get '/event' do
  @data = Curl::Easy.perform("https://www.eventbriteapi.com//v3/events/search/?q=baking&location.address=new+york&token=#{ENV['API_TOKEN']}")
  @req = JSON.parse(@data.body_str)
  puts @req
  erb :event
end

get '/cupcakes' do
  erb :cupcakes
end

get '/cookies' do
  @chocolate_chip = chocolate_chip


@songs = [ {title: 'fly', url:'https://www.youtube.com/watch?v=hnwXn0YS5Zk'},
{title: 'fly', url:'https://www.youtube.com/watch?v=hnwXn0YS5Zk'}, {title: 'fly', url:'https://www.youtube.com/watch?v=hnwXn0YS5Zk'},
{title: 'fly', url:'https://www.youtube.com/watch?v=hnwXn0YS5Zk'}]
erb :cookies
end
