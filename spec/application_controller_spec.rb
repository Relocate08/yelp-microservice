require_relative 'spec_helper'

def app
  UtilitiesController
end

describe UtilitiesController do
  before :each do
    @data = '{
   "data": [
           {
           "id": "1231",
           "name": "Xcel Energy",
           "image": "https://s3-media1.fl.yelpcdn.com/bphoto/pDZ8YQ098hOq1RzwbFFyWA/o.jpg",
           "is_closed": false,
           "url": "https://www.yelp.com/biz/xcel-energy-denver?adjust_creative=738p3EdhM6u5_PI1JBbrow&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=738p3EdhM6u5_PI1JBbrow",
           "review_count": 84,
           "rating": 1.5,
           "categories": [
               "Electricity Suppliers"
           ],
           "location": {
               "address1": "1099 18th St",
               "address2": "Ste 3000",
               "address3": "",
               "city": "Denver",
               "zip_code": "80202",
               "country": "US",
               "state": "CO"
           },
           "phone": "(800) 895-4999",
           "distance": 15497.49134034972
       },
       {
           "id": "1231245",
           "name": "Mountain Parks Electric",
           "image": "",
           "is_closed": false,
           "url": "https://www.yelp.com/biz/mountain-parks-electric-granby?adjust_creative=738p3EdhM6u5_PI1JBbrow&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=738p3EdhM6u5_PI1JBbrow",
           "review_count": 5,
           "rating": 4.0,
           "categories": [
               "Electricity Suppliers"
           ],
           "location": {
               "address1": "321 W Agate Ave",
               "address2": "",
               "address3": "",
               "city": "Granby",
               "zip_code": "80446",
               "country": "US",
               "state": "CO"
           },
           "phone": "(970) 887-3378",
           "distance": 68150.46744739878
       },
       {
           "id": "2342523",
           "name": "IREA",
           "image": "",
           "is_closed": false,
           "url": "https://www.yelp.com/biz/irea-sedalia?adjust_creative=738p3EdhM6u5_PI1JBbrow&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=738p3EdhM6u5_PI1JBbrow",
           "review_count": 1,
           "rating": 5.0,
           "categories": [
               "Electricity Suppliers"
           ],
           "location": {
               "address1": "5496 N Hwy 85",
               "address2": "",
               "address3": "",
               "city": "Sedalia",
               "zip_code": "80135",
               "country": "US",
               "state": "CO"
           },
           "phone": "(800) 332-9540",
           "distance": 31996.22270513505
       }
   ]
}'
  end

  it 'responds with a welcome message' do
    get '/'
    expect(last_response.status).to eq(200)
    body = JSON.parse(last_response.body, symbolize_names: true)

    expect(body[:message]).to include("Welcome to the Yelp Microservice!")
  end

  # Test is causing issues with Travis - further research necessary
  xit "can hit the utilities/electricity endpoint" do
    location = 80211
    get "/#{location}/utilities/electricity"
    expect(last_response).to be_successful
  end

  it 'can parse a response' do
    json = JSON.parse(@data, symbolize_names: true)
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
