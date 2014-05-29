require 'rubygems'
require 'bundler'
Bundler.setup(:default, :development, :test)

$: << File.join(File.dirname(__FILE__), '../lib/')

require 'newrelic/notificator'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each {|f| require f}

RSpec.configure do |config|
end
