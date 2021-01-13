ENV['SINATRA_ENV'] ||= 'development'
require 'rubygems'
require 'bundler'

Bundler.require(:default, ENV['SINATRA_ENV'])
Bundler.require(Sinatra::Base.environment)
$db = []

require_rel '../app'
