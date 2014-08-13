module DocGenerationWrapper
  module Adapter
    module DocRaptorService

      class Query

        def status status_id
          Proxy.status status_id, true # true is for raising on exception
        end

      end
    end
  end
end
