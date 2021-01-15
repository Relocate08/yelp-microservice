![](https://img.shields.io/badge/Ruby-2.5.3-orange) ![](https://img.shields.io/badge/Code-HTML-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://travis-ci.com/Relocate08/yelp-microservice.svg?branch=main)

# Relocate Yelp Microservice
## Setup
Development Site: https://relocate-08-yelp-microservice.herokuapp.com/
If you have not cloned down the front-end or back-end repos, you can find front-end [here](https://github.com/Relocate08/Relocate08-Front-End-Rails) and back-end [here](https://github.com/Relocate08/Relocate-Back-End-Rails)  
How to run local host:
1. Fork and clone this repo: `git clone git@github.com:Relocate08/yelp-microservice.git`
1. Run `bundle install`
1. Sign up for a [yelp api key](https://www.yelp.com/developers/documentation/v3/authentication)
1. Run ```figaro install```
1. In the application.yml file add ```YELP_API_KEY: 'Bearer  <your api key>```
1. ```bundle exec shotgun```
1. Enter the port number found in your terminal into your browser (e.g. 127.0.0.1:9393)

### Testing
```bundle exec rspec```
## Requests
### Root Path Request
```
GET '/'
```
Response:
```
{
"message": "Welcome to the Yelp Microservice!"
}
```

### Business ID Requests (Show):
```
GET 'businesses/:id'
```

### Utility Requests:
```
GET ':location/utilities/electricity'
GET ':location/utilities/water'
GET ':location/utilities/tv'
GET ':location/utilities/isps'
```

### Recreation Requests
```
GET ':location/recreation/gyms'
GET ':location/recreation/yoga'
GET ':location/recreation/parks'
GET ':location/recreation/hiking'
GET ':location/recreation/recreation'
GET ':location/recreation/pools'
GET ':location/recreation/golf'
GET ':location/recreation/playgrounds'

```

### Home Services Requests

```
GET ':location/homeservices/homecleaning'
GET ':location/homeservices/landscaping'
GET ':location/homeservices/handyman'
GET ':location/homeservices/damagerestoration'
GET ':location/homeservices/locksmiths'
GET ':location/homeservices/painters'
GET ':location/homeservices/plumbing'

```
Example Response for `GET '80211/utilities/electricity'`
```
{
    "id": "FgFmzuS4-cTIHm_IZlUEyw",
    "name": "Xcel Energy",
    "image": "https://s3-media1.fl.yelpcdn.com/bphoto/pDZ8YQ098hOq1RzwbFFyWA/o.jpg",
    "is_closed": false,
    "url": "https://www.yelp.com/biz/xcel-energy-denver?adjust_creative=hLVXR0MIhyJhliv5ar9z7g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=hLVXR0MIhyJhliv5ar9z7g",
    "review_count": 85,
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
    "distance": 2708.019879293317
}
```

### Local Events
```
GET ':location/events'
```
Example Response for `GET '80211/events'`
```
{
    "events": [
        {
            "id": "denver-upon-closer-reflection-opening-reception-and-exhibition",
            "name": "UPON CLOSER REFLECTION Opening Reception and Exhibition",
            "is_free": true,
            "is_canceled": false,
            "url": "https://www.yelp.com/events/denver-upon-closer-reflection-opening-reception-and-exhibition?adjust_creative=hLVXR0MIhyJhliv5ar9z7g&utm_campaign=yelp_api_v3&utm_medium=api_v3_event_search&utm_source=hLVXR0MIhyJhliv5ar9z7g",
            "attending_count": 1,
            "interested_count": 0,
            "location": [
                "300 W 11th Ave",
                "Ste A",
                "Denver, CO 80204"
            ],
            "time_start": "2021-01-15T17:00:00-07:00"
        }
    ]
}
```
