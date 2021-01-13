# require './config/environment'
# require 'sinatra'
require 'json'
require_relative '../services/yelp_service'

class ApplicationController < Sinatra::Base

  before do
    content_type 'application/json'
  end

  get '/' do
    JSON.generate(message: "Welcome to the Yelp Microservice!")
  end


  # do we want to change this to '/:utility/:location' so that we only need one get request? This would have to pass in the utility they want (e.g. electricity) as well as what needs to be passed to yelp (e.g. electricitysuppliers)
  get '/:location/utilities/electricity' do
    parsed_json = YelpService.fetch_parsed_json('electricitysuppliers', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/utilities/isps' do
    parsed_json = YelpService.fetch_parsed_json('isps', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/utilities/tv' do
    parsed_json = YelpService.fetch_parsed_json('televisionserviceproviders', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/utilities/water' do
    parsed_json = YelpService.fetch_parsed_json('watersuppliers', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  #recreation endpoints
  get '/:location/recreation/gyms' do
    parsed_json = YelpService.fetch_parsed_json('gyms', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/yoga' do
    parsed_json = YelpService.fetch_parsed_json('yoga', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/parks' do
    parsed_json = YelpService.fetch_parsed_json('parks', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/hiking' do
    parsed_json = YelpService.fetch_parsed_json('hiking', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/recreation' do
    parsed_json = YelpService.fetch_parsed_json('recreation', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/pools' do
    parsed_json = YelpService.fetch_parsed_json('swimmingpools', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/golf' do
    parsed_json = YelpService.fetch_parsed_json('golf', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/recreation/playgrounds' do
    parsed_json = YelpService.fetch_parsed_json('playgrounds', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  # homeservices endpoint
  get '/:location/homeservices/homecleaning' do
    parsed_json = YelpService.fetch_parsed_json('homecleaning', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/homeservices/landscaping' do
    parsed_json = YelpService.fetch_parsed_json('landscaping', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/homeservices/handyman' do
    parsed_json = YelpService.fetch_parsed_json('handyman', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/homeservices/damagerestoration' do
    parsed_json = YelpService.fetch_parsed_json('damagerestoration', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/homeservices/locksmiths' do
    parsed_json = YelpService.fetch_parsed_json('locksmiths', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/homeservices/painters' do
    parsed_json = YelpService.fetch_parsed_json('painters', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/homeservices/plumbing' do
    parsed_json = YelpService.fetch_parsed_json('plumbing', params[:location])
    BusinessSerializer.make_json(parsed_json).to_json
  end

  get '/:location/events' do
    parsed_json = YelpService.fetch_events(params[:location])
    BusinessSerializer.make_event_json(parsed_json).to_json
  end
end
