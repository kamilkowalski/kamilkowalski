require File.join(File.dirname(__FILE__), 'test_helper')

class ApiTest < Test::Unit::TestCase
  def app
    Api
  end

  def cv
    @cv ||= JSON.load(File.new('./app/cv.json'))
  end

  def json_response
    JSON.parse(last_response.body)
  end

  def test_status_codes
    (['methods'] + Api.methods).each do |m|
      get "/api/#{m}"
      assert last_response.ok?
      assert_equal 'application/json', last_response.headers['Content-Type']
    end
  end

  def test_methods_call
    get '/api/methods'
    assert_equal Api.methods, json_response
  end

  def test_data_calls
    Api.methods.each do |m|
      get "/api/#{m}"
      assert_equal cv[m], json_response
    end
  end
end
