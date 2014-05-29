require 'new_relic/cli/command.rb'
require 'yaml'

namespace :notification do

  desc 'Send notification to New Relic'

  new_relic_yml = YAML.load_file('config/newrelic.yml') rescue nil

  task :new_relic do

    begin
      rails_env = fetch(:rails_env, "production")

      config = HashWithIndifferentAccess.new(new_relic_yml)[rails_env]

      puts "Starting uploading deployment to New Relic..."

      deploy_options = {
        :environment => rails_env,
        :revision    => lookup_revision,
        :description => config[:description],
        :appname     => config[:app_name],
        :user        => config[:user] || local_user,
        :license_key => config[:license_key]
      }

      puts "Uploading deployment to New Relic"

      deployment = NewRelic::Cli::Deployments.new deploy_options
      deployment.run

      puts "Uploaded deployment information to New Relic"

    rescue NewRelic::Cli::Command::CommandFailure => e
      puts e.message

    rescue => e
      puts "Unable to notify New Relic of the deployment... skipping"
      puts "Error creating New Relic deployment (#{e})\n#{e.backtrace.join("\n")}"
    end
  end

  def lookup_revision
    `git rev-parse HEAD`[0..6]
  end

  after :deploy, 'notification:new_relic' if new_relic_yml

end
