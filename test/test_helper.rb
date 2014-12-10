ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app', 'api')
require File.join(File.dirname(__FILE__), '..', 'app', 'site')

require 'json'
require 'test/unit'
require 'rack/test'

# Include Rack methods in all tests
class Test::Unit::TestCase
  include Rack::Test::Methods
end
