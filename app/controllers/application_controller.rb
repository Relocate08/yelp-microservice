require './config/environment'
class ApplicationController < Sinatra::Base

  before do
    content_type 'application/json'
  end

  get '/' do
    JSON.generate(message: "Welcome to the Sinatra Template!")
  end

  # get '/:name' do
  #   empty_string = ""
  #   params.keys.each do |k|
  #     empty_string += params[k]
  #   end
  #   JSON.generate(message: "Welcome #{params[:name]}. I like #{empty_string} too!")
  # end
end
