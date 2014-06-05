module DocGenerationWrapper
  class Configuration
    attr_accessor :adapter

    def initialize
      @adapter = :doc_raptor
    end
  end
end
