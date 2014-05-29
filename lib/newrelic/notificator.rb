require 'active_support/hash_with_indifferent_access'
require 'active_support/core_ext/hash'
require 'new_relic/cli/command.rb'
require 'yaml'

class NewRelic::Notificator
  def initialize(stage, revision, user, newrelic_config_file)
    @stage = stage
    @revision = revision
    @user = user
    @newrelic_config_file = newrelic_config_file
  end

  def notify
    new_relic_yml = YAML.load_file(@newrelic_config_file) rescue nil
    unless new_relic_yml
      puts "Can't open New Relic config file!"
      return
    end

    config = HashWithIndifferentAccess.new(new_relic_yml)[@stage]

    deploy_options = {
      :revision    => @revision,
      :environment => @stage,
      :user        => @user,
      :description => config[:description],
      :license_key => config[:license_key],
      :appname     => config[:app_name]
    }

    puts "Uploading deployment to New Relic..."

    deployment = NewRelic::Cli::Deployments.new deploy_options
    deployment.run

    puts "Uploaded deployment information to New Relic"

  rescue => e
    puts "Unable to notify New Relic of the deployment... skipping"
    puts "Error creating New Relic deployment (#{e})\n#{e.message})\n#{e.backtrace.join("\n")}"
  end
end
