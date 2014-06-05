module DocGenerationWrapper
  module Adapter
    module DocRaptorService

      class Query

        def status status_id
          Proxy.status status_id
        end

      end
    end
  end
end
