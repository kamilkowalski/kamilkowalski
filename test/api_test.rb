ENV['RACK_ENV'] = 'test'

require './api'
require 'test/unit'
require 'rack/test'

class ApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Api
  end

  def test_status_codes
    methods = %w(methods personal education experience references achievements skills interests)

    methods.each do |m|
      get "/#{m}"
      assert last_response.ok?
      assert_equal 'application/json', last_response.headers['Content-Type']
    end
  end
end
