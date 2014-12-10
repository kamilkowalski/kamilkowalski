require 'sinatra/base'

class Site < Sinatra::Application
  set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')

  not_found do
    haml :error_404, format: :html5
  end

  get '/' do
    haml :homepage, format: :html5
  end
end
