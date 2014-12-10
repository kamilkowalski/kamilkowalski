require './app/site'
require './app/api'

run Rack::Cascade.new([Api, Site])
