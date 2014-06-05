module DocGenerationWrapper
  module Adapter
    module DocRaptorService

      class Command

        def create! options
          Proxy.create! options
        end

      end
    end
  end
end
