module DocGenerationWrapper
  module Adapter
    module DocRaptorService

      class Query

        def status status_id
          DocRaptor::DocApi.new.get_async_doc_status(status_id)
        end

      end
    end
  end
end
