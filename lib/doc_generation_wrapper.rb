require_relative 'doc_generation_wrapper/version'
require_relative 'doc_generation_wrapper/configuration'
require_relative 'doc_generation_wrapper/adapters/base'

begin
  require 'pry'
rescue LoadError
end

require 'forwardable'

module DocGenerationWrapper
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  class Wrapper
    extend Forwardable

    def_delegators :adapter, :create!, :status
    attr_reader :adapter

    def initialize
      @adapter = Adapter::Base.create(DocGenerationWrapper.configuration.adapter)
    end

  end
end
