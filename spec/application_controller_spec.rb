require_relative 'spec_helper'

def app
  ApplicationController
end


describe ApplicationController do
  it 'responds with a welcome message' do
    get '/'
    expect(last_response.status).to eq(200)
    body = JSON.parse(last_response.body, symbolize_names: true)

    expect(body[:message]).to include("Welcome to the Sinatra Template!")
  end

  it 'can get utility data' do
    location = 80211
    get "/#{location}/utilities/electricity"
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      items = json[:data]
      items.each do |item|
        expect(item).to have_key(:name)
        expect(item[:name]).to be_an(String)
        expect(item[:attributes]).to have_key(:is_closed)
        expect(item[:attributes][:is_closed]).to be_a(Boolean)
        expect(item[:attributes]).to have_key(:description)
        expect(item[:attributes][:description]).to be_a(String)
        expect(item[:attributes]).to have_key(:unit_price)
        expect(item[:attributes][:unit_price]).to be_a(Float)
        expect(item[:attributes]).to have_key(:merchant_id)
        expect(item[:attributes][:merchant_id]).to be_a(Integer)
      end
  end
end
