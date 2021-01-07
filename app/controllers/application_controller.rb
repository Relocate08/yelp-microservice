require './config/environment'
class ApplicationController < Sinatra::Base

  before do
    content_type 'application/json'
  end

  get '/' do
    JSON.generate(message: "Welcome to the Sinatra Template!")
  end

  get '/:location/utilities/electricity' do
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get("/v3/businesses/search?categories=electricitysuppliers&location=#{params[:location]}")
    json = JSON.parse(response.body, symbolize_names: true)
    render json: UtilitySerializer.make_json(json)
  end

  # get '/:name' do
  #   empty_string = ""
  #   params.keys.each do |k|
  #     empty_string += params[k]
  #   end
  #   JSON.generate(message: "Welcome #{params[:name]}. I like #{empty_string} too!")
  # end
end
