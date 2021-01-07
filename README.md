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
```
{
"message": "Welcome to the Yelp Microservice!"
}
```
### Electricity Utility Request
```
GET ':location/utilities/electricity'
```
```
{
  "message": "Welcome hanna"
}
```