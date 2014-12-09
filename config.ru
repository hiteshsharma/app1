require 'thin'
require 'bundler'
Bundler.require

set :server, 'thin'
require './app.rb'
run Sinatra::Application