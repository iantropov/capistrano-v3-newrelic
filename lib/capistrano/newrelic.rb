require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rbenv'
require 'capistrano/bundler'

load File.expand_path("../tasks/newrelic.rake", __FILE__)
