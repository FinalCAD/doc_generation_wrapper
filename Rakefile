require 'rubygems'
require 'bundler/setup'

require 'bundler/gem_tasks'

require 'rake'
require 'rspec'

require_relative 'lib/doc_generation_wrapper'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task default: :spec
