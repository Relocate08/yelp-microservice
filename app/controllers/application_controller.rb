require './config/environment'
require 'sinatra'
require 'json'
class ApplicationController < Sinatra::Base

  before do
    content_type 'application/json'
  end

  get '/' do
    JSON.generate(message: "Welcome to the Yelp Microservice!")
  end


  # do we want to change this to '/:utility/:location' so that we only need one get request? This would have to pass in the utility they want (e.g. electricity) as well as what needs to be passed to yelp (e.g. electricitysuppliers)
  get '/:location/utilities/electricity' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=electricitysuppliers&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    UtilitySerializer.make_json(parsed_json).to_json
  end

  get '/:location/utilities/isps' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=isps&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    UtilitySerializer.make_json(parsed_json).to_json
  end

  get '/:location/utilities/tv' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=televisionserviceproviders&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    UtilitySerializer.make_json(parsed_json).to_json
  end

  get '/:location/utilities/water' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=watersuppliers&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    UtilitySerializer.make_json(parsed_json).to_json
  end
  #recreation endpoints
  get '/:location/recreation/gyms' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=gyms&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/yoga' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=yoga&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/parks' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=parks&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/hiking' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=hiking&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/recreation' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=recreation&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/pools' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=swimmingpools&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/golf' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=golf&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/playgrounds' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=playgrounds&location=#{params[:location]}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    BusinessSerializer.make_json(parsed_json).to_json
  end
end
