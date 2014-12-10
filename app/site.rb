require 'sinatra/base'
require 'haml'
require 'kramdown'

class Site < Sinatra::Application
  set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')

  helpers do
    def link_to(content:, href:, **attribs)
      attributes = ["href=\"#{href}\""]
      attribs.each_pair { |key, value| attributes << "#{key}=\"#{value}\"" }
      attributes = attributes.join(' ')

      "<a #{attributes}>#{content}</a>"
    end
  end

  not_found do
    haml :error_404, format: :html5
  end

  get '/' do
    haml :homepage, format: :html5
  end
end
