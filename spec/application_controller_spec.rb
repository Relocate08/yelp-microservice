require_relative 'spec_helper'

def app
  ApplicationController
end

describe ApplicationController do
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

  xit 'responds with a welcome message' do
    get '/'
    expect(last_response.status).to eq(200)
    body = JSON.parse(last_response.body, symbolize_names: true)

    expect(body[:message]).to include('Welcome to the Yelp Microservice!')
  end

  xit 'can hit the utilities/electricity endpoint' do
    location = 80211
    get "/#{location}/utilities/electricity"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Electricity Suppliers')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the utilities/isps endpoint' do
    location = 80211
    get "/#{location}/utilities/isps"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Internet Service Providers')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the utilities/tv endpoint' do
    location = 80211
    get "/#{location}/utilities/tv"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Television Service Providers')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the utilities/water endpoint' do
    location = 80211
    get "/#{location}/utilities/water"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Water Suppliers')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the recreation/gyms endpoint' do
    location = 80211
    get "/#{location}/recreation/gyms"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Gyms')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the recreation/yoga endpoint' do
    location = 80211
    get "/#{location}/recreation/yoga"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Yoga')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the recreation/parks endpoint' do
    location = 80211
    get "/#{location}/recreation/parks"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Parks')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the recreation/hiking endpoint' do
    location = 80211
    get "/#{location}/recreation/hiking"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Hiking')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the recreation/recreation endpoint' do
    location = 80211
    get "/#{location}/recreation/recreation"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Recreation Centers')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the recreation/pools endpoint' do
    location = 80211
    get "/#{location}/recreation/pools"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Swimming Pools')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the recreation/golf endpoint' do
    location = 80211
    get "/#{location}/recreation/golf"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Golf')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the recreation/playgrounds endpoint' do
    location = 80211
    get "/#{location}/recreation/playgrounds"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Playgrounds')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the homeservices/homecleaning endpoint' do
    location = 80211
    get "/#{location}/homeservices/homecleaning"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Home Cleaning')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the homeservices/landscaping endpoint' do
    location = 80211
    get "/#{location}/homeservices/landscaping"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Landscaping')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the homeservices/handyman endpoint' do
    location = 80211
    get "/#{location}/homeservices/handyman"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Handyman')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the homeservices/damagerestoration endpoint' do
    location = 80211
    get "/#{location}/homeservices/damagerestoration"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Damage Restoration')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the homeservices/locksmiths endpoint' do
    location = 80211
    get "/#{location}/homeservices/locksmiths"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Keys & Locksmiths')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the homeservices/painters endpoint' do
    location = 80211
    get "/#{location}/homeservices/painters"
    expect(last_response).to be_successful
    found = false
    data = JSON.parse(last_response.body, symbolize_names: true)
    data = data[:data]
    data.each do |biz|
      found = true if biz[:categories].include?('Painters')
    end
    expect(found).to eq(true)
  end

  xit 'can hit the homeservices/plumbing endpoint' do
    location = 80211
    get "/#{location}/homeservices/plumbing"
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
      expect(biz[:is_closed]).to be(true).or be(false)
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

  it 'can return a single business' do
    business_id = "FgFmzuS4-cTIHm_IZlUEyw"
    get "/businesses/#{business_id}"
    expect(last_response).to be_successful
  end

  it 'can return top 5 events' do
    location = 'newyork'
    get "/#{location}/events"
    expect(last_response).to be_successful
  end
end
