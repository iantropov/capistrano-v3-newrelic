require 'tempfile'
module NewRelic::ConfigFaker
  def self.with_config
    options = { :test => {} }
    file = Tempfile.new('newrelic_config')
    begin
      file.write(options.to_yaml)
      file.close
      yield(file.path)
    ensure
      file.close
      file.unlink
    end
  end
end
