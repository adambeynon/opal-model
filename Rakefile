require 'bundler/setup'
require 'opal/rake_task'

Opal::RakeTask.new do |t|
  t.name = 'opal-model'
  t.dependencies = %w[opal-spec]
end

task :default => [:opal, 'opal:test']
