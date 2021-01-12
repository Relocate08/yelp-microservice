ENV['SINATRA_ENV'] ||= "development"
require "rubygems"
require "bundler"
Bundler.require(:default, ENV['SINATRA_ENV'])
Bundler.require(Sinatra::Base.environment)
# require "active_support/deprecation"
# require "active_support/all"
$db = []

require_rel '../app'
