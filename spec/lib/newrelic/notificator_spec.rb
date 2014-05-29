require 'spec_helper'

describe NewRelic::Notificator do

  it "should load new relic settings and notify" do
    NewRelic::ConfigFaker.with_config do |filename|
      NewRelic::Cli::Deployments.any_instance.should_receive :run
      described_class.new(:test, '123', 'user', filename).notify
    end
  end

  it "shouldn't notify without config options" do
    NewRelic::Cli::Deployments.any_instance.should_not_receive :run
    described_class.new(:test, '123', 'user', 'filename').notify
  end

end
