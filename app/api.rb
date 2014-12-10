require 'sinatra/base'
require 'json'

class Api < Sinatra::Application

  @@methods = %w(personal education experience references achievements skills interests).freeze

  class << self
    def methods
      @@methods
    end
  end

  def cv
    JSON.load(File.new('./app/cv.json'))
  end

  get '/api/methods' do
    content_type :json
    self.class.methods.to_json
  end

  get '/api/:method' do
    return 404 unless self.class.methods.include? params[:method]

    content_type :json
    cv[params[:method]].to_json
  end
end
