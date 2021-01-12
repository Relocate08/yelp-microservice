require './config/environment'
require 'figaro/sinatra'

use ApplicationController
use YelpService
run Sinatra::Application
