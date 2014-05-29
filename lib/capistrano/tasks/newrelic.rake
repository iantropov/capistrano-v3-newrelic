require 'newrelic/notificator'

namespace :notification do

  desc 'Send notification to New Relic'
  task :newrelic do
    env = fetch(:env, "production")
    revision = `git rev-parse HEAD`[0..6]
    notificator = NewRelic::Notificator.new(env, revision, local_user, 'config/newrelic.yml')
    notificator.notify
  end

  after :deploy, 'notification:newrelic'

end
