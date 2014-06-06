module DocGenerationWrapper
  module Adapter
    module DocRaptorService

      class Command

        def create! options, &respond_callback
          Proxy.create! options
          respond_callback.call Proxy.status_id if block_given?
          nil
        end

      end
    end
  end
end
