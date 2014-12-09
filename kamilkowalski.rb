require 'sinatra/base'

class Kamilkowalski < Sinatra::Application
  get '/' do
    'Hello world'
  end
end
