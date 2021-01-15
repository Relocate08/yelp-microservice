![](https://img.shields.io/badge/Ruby-2.5.3-orange) ![](https://travis-ci.com/Relocate08/yelp-microservice.svg?branch=main)

# Relocate Yelp Microservice

## Table of Contents
* [Setup](https://github.com/Relocate08/yelp-microservice/blob/main/README.md#setup)
* [Requests](https://github.com/Relocate08/yelp-microservice/blob/main/README.md#requests)
* [Authors](https://github.com/Relocate08/yelp-microservice/blob/main/README.md#authors)

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

## Authors
  - **Christopher Allbritton** - *Turing Student* - [GitHub Profile](https://github.com/Callbritton) - [Turing Alum Profile](https://alumni.turing.io/alumni/christopher-allbritton) - [LinkedIn](https://www.linkedin.com/in/christopher-allbritton)
  - **Dani Coleman** - *Turing Student* - [GitHub Profile](https://github.com/dcoleman21) - [Turing Alum Profile](https://alumni.turing.io/alumni/dani-coleman) - [LinkedIn](https://www.linkedin.com/in/dcoleman-21/)
  - **Kevin Cuadros** - *Turing Student* - [GitHub Profile](https://github.com/kevxo) - [Turing Alum Profile](https://alumni.turing.io/alumni/kevin-david-cuadros) - [LinkedIn](https://www.linkedin.com/in/kevin-cuadros-2bb4551a1/)
  - **Hanna Davis** - *Turing Student* - [GitHub Profile](https://github.com/Oxalisviolacea) - [Turing Alum Profile](https://alumni.turing.io/alumni/hanna-davis) - [LinkedIn](https://www.linkedin.com/in/hanna-davis/)
  - **Hope Gochnour** - *Turing Student* - [GitHub Profile](https://github.com/hopesgit) - [Turing Alum Profile](https://alumni.turing.io/alumni/hope-mcgee) - [LinkedIn](https://www.linkedin.com/in/hope-gochnour-3056aa1ba/)
  - **Jake Heft** - *Turing Student* - [GitHub Profile](https://github.com/jakeheft) - [Turing Alum Profile](https://alumni.turing.io/alumni/jake-heft) - [LinkedIn](https://www.linkedin.com/in/jakeheft/)
  - **John Kim** - *Turing Student* - [GitHub Profile](https://github.com/abcdefghijohn) - [Turing Alum Profile](https://alumni.turing.io/alumni/john-kim) - [LinkedIn](https://www.linkedin.com/in/abcdefghijohn/)
  - **Jose Lopez** - *Turing Student* - [GitHub Profile](https://github.com/JoseLopez235) - [Turing Alum Profile](https://alumni.turing.io/alumni/jose-lopez) - [LinkedIn](https://www.linkedin.com/in/jose-lopez-0551a01a1/)
  - **Brett Sherman** - *Turing Student* - [GitHub Profile](https://github.com/BJSherman80) - [Turing Alum Profile](https://alumni.turing.io/alumni/brett-sherman) - [LinkedIn](https://www.linkedin.com/in/brettshermanll/)
  - **Zach Stearns** - *Turing Student* - [GitHub Profile](https://github.com/Stearnzy) - [Turing Alum Profile](https://alumni.turing.io/alumni/zach-stearns) - [LinkedIn](https://www.linkedin.com/in/zach-stearns/)
