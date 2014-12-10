require './app/site'
require './app/api'
require 'sass/plugin/rack'

Sass::Plugin.options[:template_location] = 'app/assets/css'
Sass::Plugin.options[:css_location] = 'public/css'

use Sass::Plugin::Rack
run Rack::Cascade.new([Api, Site])
