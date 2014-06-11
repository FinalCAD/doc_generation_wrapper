module DocGenerationWrapper
  class Configuration
    attr_accessor :adapter, :service_host

    def initialize
      @adapter = :doc_raptor
      @service_host = 'http://0.0.0.0:5000'
    end
  end
end
