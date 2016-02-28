module DocGenerationWrapper
  module Adapter
    module DocRaptorService

      class Query

        def status status_id
          DocRaptor::DocApi.new.get_async_doc_status(status_id)
        end

        def document download_id
          DocRaptor::DocApi.new.get_async_doc(download_id)
        end

      end
    end
  end
end
