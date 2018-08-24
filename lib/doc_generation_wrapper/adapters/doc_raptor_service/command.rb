module DocGenerationWrapper
  module Adapter
    module DocRaptorService

      class Command

        def create! options, &respond_callback
          request_parameters = DocGenerationWrapper.configuration.global_parameters.merge(options)

          response = DocRaptor::DocApi.new.create_async_doc(request_parameters)
          respond_callback.call response.status_id if block_given?
          nil
        end

      end
    end
  end
end
