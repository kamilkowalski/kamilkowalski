ENV['RACK_ENV'] = 'test'

require './kamilkowalski'
require 'test/unit'
require 'rack/test'

class HomepageTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home_page_content
    get '/'
    assert last_response.ok?
    assert last_response.body.include? 'Kamil Kowalski'
    assert last_response.body.include? 'Elance'
    assert last_response.body.include? 'CV'
  end

  def test_cv_link
    get '/KamilKowalski-CV.pdf'
    assert_equal File.size('./public/KamilKowalski-CV.pdf'), last_response.headers['Content-Length'].to_i
  end
end
