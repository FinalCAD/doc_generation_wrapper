module DocGenerationWrapper
  module Adapter
    module DocRaptorService

      class Command

        def create! options, &respond_callback
          response = DocRaptor::DocApi.new.create_async_doc(options)
          respond_callback.call response.status_id if block_given?
          nil
        end

      end
    end
  end
end
