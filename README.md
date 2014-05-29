capistrano-v3-newrelic
======================

Capistrano v3 task for New Relic notification about deployment

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-v3-newrelic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cap-newrelic

## Usage

Require the module in your `Capfile`:

```ruby
require 'capistrano/newrelic'
```

Gem comes with 1 task `notification:newrelic`.

By default the task will run after `deploy`


### Configuration

Configurable options, set in `newrelic.yml` config.

## Thanks

This code started out based on [https://github.com/newrelic/rpm](https://github.com/newrelic/rpm) (for Capistrano v2)

