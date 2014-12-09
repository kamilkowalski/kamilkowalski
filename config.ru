require './kamilkowalski'
require './api'

run Rack::Cascade.new([Kamilkowalski, Api])
