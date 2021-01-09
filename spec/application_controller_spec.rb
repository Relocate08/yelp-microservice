require_relative 'spec_helper'

def app
  ApplicationController
end


describe ApplicationController do
  it 'responds with a welcome message' do
    get '/'
    expect(last_response.status).to eq(200)
    body = JSON.parse(last_response.body, symbolize_names: true)

    expect(body[:message]).to include("Welcome to the Yelp Microservice!")
  end

  it 'can get utility data' do
    location = 80211
    get "/#{location}/utilities/electricity"
    expect(last_response).to be_successful
    json = JSON.parse(last_response.body, symbolize_names: true)

    expect(json).to have_key(:data)
    expect(json[:data]).to be_an(Array)
    utilities = json[:data]
    utilities.each do |biz|
        expect(biz).to have_key(:id)
        expect(biz[:id]).to be_an(String)
        expect(biz).to have_key(:name)
        expect(biz[:name]).to be_an(String)
        expect(biz).to have_key(:is_closed)
        expect(biz[:is_closed]).to be_in([true, false])
        expect(biz).to have_key(:url)
        expect(biz[:url]).to be_a(String)
        expect(biz).to have_key(:image)
        expect(biz[:image]).to be_a(String)
        expect(biz).to have_key(:review_count)
        expect(biz[:review_count]).to be_a(Integer)
        expect(biz).to have_key(:rating)
        expect(biz[:rating]).to be_a(Float)
        expect(biz).to have_key(:categories)
        expect(biz[:categories]).to be_a(Array)
        expect(biz).to have_key(:location)
        expect(biz[:location]).to be_a(Hash)
        expect(biz[:location]).to have_key(:address1)
        expect(biz[:location][:address1]).to be_a(String)
        expect(biz[:location]).to have_key(:address2)
        expect(biz[:location][:address2]).to be_a(String)
        expect(biz[:location]).to have_key(:address3)
        expect(biz[:location]).to have_key(:city)
        expect(biz[:location][:city]).to be_a(String)
        expect(biz[:location]).to have_key(:zip_code)
        expect(biz[:location][:zip_code]).to be_a(String)
        expect(biz[:location]).to have_key(:country)
        expect(biz[:location][:country]).to be_a(String)
        expect(biz[:location]).to have_key(:state)
        expect(biz[:location][:state]).to be_a(String)
        expect(biz).to have_key(:phone)
        expect(biz[:phone]).to be_a(String)
        expect(biz).to have_key(:distance)
        expect(biz[:distance]).to be_a(Float)
      end
  end
end
