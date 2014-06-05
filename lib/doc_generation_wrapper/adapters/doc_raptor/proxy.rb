module DocGenerationWrapper
  module Adapter
    module DocRaptor
      module Proxy
        extend self

        def method_missing method, *args
          tries = 0
          begin
            ::DocRaptor.send method, *args
          rescue Errno::ETIMEDOUT, Errno::ENOENT, Errno::ECONNRESET, Timeout::Error
            (tries += 1) < 3 ? retry : raise
          rescue DocRaptorException::DocumentCreationFailure => exception
            if exception.message.match(/Too many simultaneous document requests/) && (tries+=1) < 5
              wait_before_retrying && retry
            else
              raise
            end
          end
        end

        def wait_before_retrying
          Rails.logger.error '[DocGen] Docraptor can\'t accept more than 5 concurrent requests (auto-retry)'
          sleep 5
        end

      end
    end
  end
end
