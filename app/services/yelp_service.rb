require './config/environment'
require 'sinatra'
require 'json'
require 'faraday'

class YelpService < Sinatra::Base
	def self.fetch_parsed_json(category, location)
		conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
		end
		response = conn.get("/v3/businesses/search?categories=#{category}&location=#{location}")
		parsed_json = JSON.parse(response.body, symbolize_names: true)
	end
end