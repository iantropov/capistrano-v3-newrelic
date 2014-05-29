# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "capistrano-v3-newrelic"
  s.version = `cat VERSION`

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan Antropov"]
  s.date = "2014-05-29"
  s.description = "Capistrano v3 task for New Relic notification about deployment"
  s.email = ["antropov.ivan@gmail.com"]
  s.extra_rdoc_files = [ "LICENSE.txt", "README.rdoc" ]
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.6.2"
  s.summary = "Sends New Relic deployment notifications"

  s.add_dependency("capistrano", "~> 3.1.0")
  s.add_dependency("capistrano-rails")
  s.add_dependency("capistrano-rbenv", "~> 2.0")
  s.add_dependency("newrelic_rpm", ">= 3.7.0")

  s.add_development_dependency("bundler")
  s.add_development_dependency("rake")
  s.add_development_dependency("rspec")
  s.add_development_dependency("yard")
  s.add_development_dependency("fakefs")
end
