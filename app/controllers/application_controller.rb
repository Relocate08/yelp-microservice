require './config/environment'
class ApplicationController < Sinatra::Base

  before do
    content_type 'application/json'
  end

  get '/' do
    JSON.generate(message: "Welcome to the Sinatra Template!")
  end
end
