require File.join(File.dirname(__FILE__), 'test_helper')

class HomepageTest < Test::Unit::TestCase
  def app
    Site
  end

  def test_home_page_content
    get '/'
    assert last_response.ok?
    assert last_response.body.include? 'Kamil Kowalski'
    assert last_response.body.include? 'kamil@kamilkowalski.pl'
    assert last_response.body.include? 'Elance'
    assert last_response.body.include? 'LinkedIn'
    assert last_response.body.include? 'CV'
  end

  def test_cv_link
    get '/KamilKowalski-CV.pdf'
    assert_equal File.size('./public/KamilKowalski-CV.pdf'), last_response.headers['Content-Length'].to_i
  end
end
